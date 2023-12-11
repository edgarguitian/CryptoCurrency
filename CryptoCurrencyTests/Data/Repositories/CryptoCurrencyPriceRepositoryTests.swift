//
//  CryptoCurrencyRepositoryTests.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import XCTest
@testable import CryptoCurrency

final class CryptoCurrencyPriceRepositoryTests: XCTestCase {

    func test_getPrice() async throws {
        let mockApiDataSource = MockApiPriceDataSource()
        let mockErrorMapper = MockCryptoCurrencyDomainErrorMapper()
        let repository = CryptoCurrencyPriceRepository(apiDataSource: mockApiDataSource,
                                                       errorMapper: mockErrorMapper)

        let result = await repository.getPrice(cryptoId: "BTC")

        switch result {
        case .success(let priceInfo):
            XCTAssertEqual(priceInfo.price, 40763)
        case .failure(let error):
            XCTFail("Error: \(error)")
        }
    }
}
