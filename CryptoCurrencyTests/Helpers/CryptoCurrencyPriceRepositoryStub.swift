//
//  CryptoCurrencyPriceRepositoryStub.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation
@testable import CryptoCurrency

class CryptoCurrencyPriceRepositoryStub: CryptoCurrencyPriceRepositoryType {
    private let result: Result<CryptoCurrencyPrice, CryptoCurrencyDomainError>
    
    init(result: Result<CryptoCurrencyPrice, CryptoCurrencyDomainError>) {
        self.result = result
    }
    
    func getPrice(cryptoId: String) async -> Result<CryptoCurrencyPrice, CryptoCurrencyDomainError> {
        return result
    }
}
