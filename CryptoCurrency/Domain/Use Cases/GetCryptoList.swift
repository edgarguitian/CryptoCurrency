//
//  GetCryptoList.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

// MARK: caso de uso para la obtención de las cryptocurrency
class GetCryptoList: GetCryptoListType {
    private let repository: CryptoListRepositoryType

    init(repository: CryptoListRepositoryType) {
        self.repository = repository
    }

    func execute(currentPage: Int) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> {
        let result = await repository.getCryptoList(currentPage: currentPage)

        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }

            return .failure(error)
        }

        return .success(cryptoList.sorted { $0.name < $1.name })
    }
}
