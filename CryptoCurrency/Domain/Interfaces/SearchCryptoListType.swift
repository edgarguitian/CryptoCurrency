//
//  SearchCryptoListType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

protocol SearchCryptoListType {
    func execute(searchText: String) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError>
}
