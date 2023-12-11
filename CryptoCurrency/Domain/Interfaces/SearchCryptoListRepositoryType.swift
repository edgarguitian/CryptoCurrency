//
//  SearchCryptoListRepositoryType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

protocol SearchCryptoListRepositoryType {
    func search(searchText: String) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError>
}
