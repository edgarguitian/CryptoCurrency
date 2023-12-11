//
//  CryptoCurrencyPriceRepositoryType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

protocol CryptoCurrencyPriceRepositoryType {
    func getPrice(cryptoId: String) async -> Result<CryptoCurrencyPrice, CryptoCurrencyDomainError>
}
