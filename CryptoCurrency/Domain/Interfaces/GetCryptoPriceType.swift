//
//  GetCryptoPriceType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

protocol GetCryptoPriceType {
    func execute(id: String) async -> Result<CryptoCurrencyPrice, CryptoCurrencyDomainError>
}
