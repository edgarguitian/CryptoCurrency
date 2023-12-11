//
//  SearchCryptoList.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class SearchCryptoList: SearchCryptoListType {
    private let repository: SearchCryptoListRepositoryType

    init(repository: SearchCryptoListRepositoryType) {
        self.repository = repository
    }

    func execute(searchText: String) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> {
        let result = await repository.search(searchText: searchText)

        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }

            return .failure(error)
        }

        return .success(cryptoList.sorted { $0.name < $1.name })
    }
}
