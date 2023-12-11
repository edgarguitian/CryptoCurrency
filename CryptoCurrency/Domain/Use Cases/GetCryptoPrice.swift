//
//  GetCryptoPrice.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

class GetCryptoPrice: GetCryptoPriceType {
    private let repository: CryptoCurrencyPriceRepositoryType

    init(repository: CryptoCurrencyPriceRepositoryType) {
        self.repository = repository
    }

    func execute(id: String) async -> Result<CryptoCurrencyPrice, CryptoCurrencyDomainError> {
        return await repository.getPrice(cryptoId: id)
    }
}
