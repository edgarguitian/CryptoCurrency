//
//  SearchCryptoListRepositoryStub.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation
@testable import CryptoCurrency

class SearchCryptoListRepositoryStub: SearchCryptoListRepositoryType {
    private let result: Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError>

    init(result: Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError>) {
        self.result = result
    }
    
    func search(searchText: String) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> {
        return result
    }
}
