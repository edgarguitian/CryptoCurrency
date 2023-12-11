//
//  GetCryptoListType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

protocol GetCryptoListType {
    func execute(currentPage: Int) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError>
}
