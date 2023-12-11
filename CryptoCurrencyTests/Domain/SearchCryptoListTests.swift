//
//  SearchCryptoListTests.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import XCTest
@testable import CryptoCurrency

final class SearchCryptoListTests: XCTestCase {

    func test_execute_sucesfully_returns_sorted_array_when_repository_returns_nonEmpty_array() async throws {
        // GIVEN
        let mockArray = [
            CryptoCurrencyMarket(id: "2", symbol: "sym2", name: "testName2", image: "image2"),
            CryptoCurrencyMarket(id: "1", symbol: "sym1", name: "testName1", image: "image1"),
            CryptoCurrencyMarket(id: "3", symbol: "sym3", name: "testName3", image: "image3")
        ]
        let result: Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> = .success(mockArray)
        let stub = SearchCryptoListRepositoryStub(result: result)
        let sut = SearchCryptoList(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute(searchText: "")
        
        // THEN
        let capturedCryptoList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedCryptoList[0], mockArray[1])
        XCTAssertEqual(capturedCryptoList[1], mockArray[0])
        XCTAssertEqual(capturedCryptoList[2], mockArray[2])
    }
    
    func test_execute_sucesfully_returns_sorted_array_when_repository_returns_nonEmpty_sorted_array() async {
        // GIVEN
        let mockArray = [
            CryptoCurrencyMarket(id: "1", symbol: "sym1", name: "testName1", image: "image1"),
            CryptoCurrencyMarket(id: "2", symbol: "sym2", name: "testName2", image: "image2"),
            CryptoCurrencyMarket(id: "3", symbol: "sym3", name: "testName3", image: "image3")
        ]
        let result: Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> = .success(mockArray)
        let stub = SearchCryptoListRepositoryStub(result: result)
        let sut = SearchCryptoList(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute(searchText: "")
        
        // THEN
        XCTAssertEqual(capturedResult, result)
    }
    
    func test_execute_sucesfully_returns_anEmpty_array_when_repository_returns_anEmpty_array() async {
        // GIVEN
        let result: Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> = .success([])
        let stub = SearchCryptoListRepositoryStub(result: result)
        let sut = SearchCryptoList(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute(searchText: "")
        
        // THEN
        XCTAssertEqual(capturedResult, result)
    }
    
    func test_execute_returns_error_when_repository_returns_error() async {
        // GIVEN
        let result: Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError> = .failure(.generic)
        let stub = SearchCryptoListRepositoryStub(result: result)
        let sut = SearchCryptoList(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute(searchText: "")
        
        // THEN
        XCTAssertEqual(capturedResult, result)
    }
}
