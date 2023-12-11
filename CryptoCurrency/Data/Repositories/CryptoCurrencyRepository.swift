//
//  CryptoCurrencyRepository.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

// MARK: repositorio de obtiene los datos de las CryptoCurrency
class CryptoCurrencyRepository: CryptoListRepositoryType {
    private let apiDatasource: APICryptoCurrencyDataSourceType
    private let errorMapper: CryptoCurrencyDomainErrorMapper
    private let cacheDatasource: CacheCryptoCurrencyDataSourceType

    init(apiDatasource: APICryptoCurrencyDataSourceType,
         errorMapper: CryptoCurrencyDomainErrorMapper,
         cacheDatasource: CacheCryptoCurrencyDataSourceType) {
        self.apiDatasource = apiDatasource
        self.errorMapper = errorMapper
        self.cacheDatasource = cacheDatasource
    }

    func getCryptoList(currentPage: Int) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> {
        let cryptoListCache = await cacheDatasource.getCryptoList()

        if !cryptoListCache.isEmpty && cryptoListCache.count > currentPage * 250 {
            return .success(cryptoListCache)
        }

        let cryptoListIdsResult = await apiDatasource.getCryptoList()

        guard case .success(let cryptoListIds) = cryptoListIdsResult else {
            return .failure(errorMapper.map(error: cryptoListIdsResult.failureValue as? HTTPClientError))
        }
        let listIdCryptos = cryptoListIds.map { $0.id }
        let pageIdsCryptos = Array(listIdCryptos.elementsForPage(currentPage, elementsPerPage: 250))
        let cryptoListInfoResult = await apiDatasource.getCryptoListMarket(cryptosListId: pageIdsCryptos)

        guard case .success(let cryptoListInfo) = cryptoListInfoResult else {
            return .failure(errorMapper.map(error: cryptoListInfoResult.failureValue as? HTTPClientError))
        }

        let cryptoListDomain = cryptoListInfo.map {
            CryptoCurrencyMarket(id: $0.id, symbol: $0.symbol, name: $0.name, image: $0.image)
        }
        await cacheDatasource.saveCryptoList(cryptoListDomain)

        return .success(cryptoListDomain)
    }
}

extension CryptoCurrencyRepository: SearchCryptoListRepositoryType {
    func search(searchText crypto: String) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> {
        let result = await getCryptoList(currentPage: -1)

        guard case .success(let cryptoList) = result else {
            return result
        }

        guard crypto != "" else {
            return result
        }

        let filteredCryptoList = cryptoList.filter {
            $0.name.lowercased().contains(crypto.lowercased()) || $0.symbol.lowercased().contains(crypto.lowercased())
        }

        return .success(filteredCryptoList)
    }
}
