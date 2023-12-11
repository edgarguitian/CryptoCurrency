//
//  CryptoCurrencyPriceRepository.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

// MARK: repositorio de obtiene los precios de las CryptoCurrency
class CryptoCurrencyPriceRepository: CryptoCurrencyPriceRepositoryType {
    private let apiDataSource: ApiPriceDataSourceType
    private let errorMapper: CryptoCurrencyDomainErrorMapper

    init(apiDataSource: ApiPriceDataSourceType, errorMapper: CryptoCurrencyDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }

    func getPrice(cryptoId id: String) async -> Result<CryptoCurrencyPrice, CryptoCurrencyDomainError> {
        let result = await apiDataSource.getPriceForCryptos(cryptoId: [id])

        guard case .success(let priceInfoDictionary) = result else {
            return .failure(errorMapper.map(error: result.failureValue as? HTTPClientError))
        }

        guard let priceInfo = priceInfoDictionary.values.first else {
            return .failure(.generic)
        }

        let priceInfoDomain = CryptoCurrencyPrice(price: priceInfo.price,
                                                      price24h: priceInfo.price24h,
                                                      volume24h: priceInfo.volume24h,
                                                      marketCap: priceInfo.marketCap)
        return .success(priceInfoDomain)
    }
}
