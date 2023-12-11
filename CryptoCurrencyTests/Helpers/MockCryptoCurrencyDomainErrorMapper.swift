//
//  MockCryptoCurrencyDomainErrorMapper.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 8/12/23.
//

import Foundation
@testable import CryptoCurrency

class MockCryptoCurrencyDomainErrorMapper: CryptoCurrencyDomainErrorMapper {
    override func map(error: HTTPClientError?) -> CryptoCurrencyDomainError {
        return .generic
    }
}
