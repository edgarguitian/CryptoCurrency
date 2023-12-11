//
//  GetCryptoPriceTests.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import XCTest
@testable import CryptoCurrency

final class GetCryptoPriceTests: XCTestCase {

    func test_execute_returns_succesfully_price_when_repository_returns_price() async {
        // GIVEN
        let mockPrice = CryptoCurrencyPrice(price: 1, price24h: 2, volume24h: 3, marketCap: 4)
        let result: Result<CryptoCurrencyPrice, CryptoCurrencyDomainError> = .success(mockPrice)
        let stub = CryptoCurrencyPriceRepositoryStub(result: result)
        let sut = GetCryptoPrice(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute(id: "")
        
        // THEN
        XCTAssertEqual(capturedResult, result)
    }
    
    func test_execute_returns_error_when_repository_returns_error() async {
        // GIVEN
        let result: Result<CryptoCurrencyPrice, CryptoCurrencyDomainError> = .failure(.generic)
        let stub = CryptoCurrencyPriceRepositoryStub(result: result)
        let sut = GetCryptoPrice(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute(id: "")
        
        // THEN
        XCTAssertEqual(capturedResult, result)
    }
}
