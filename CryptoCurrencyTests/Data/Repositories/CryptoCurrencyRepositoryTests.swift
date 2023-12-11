//
//  CryptoCurrencyRepositoryTests.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 8/12/23.
//

import XCTest
@testable import CryptoCurrency

final class CryptoCurrencyRepositoryTests: XCTestCase {

    func test_getCryptoList() async throws {
        // GIVEN
        let mockApiDataSource = MockApiCryptoDataSource()
        let mockErrorMapper = MockCryptoCurrencyDomainErrorMapper()
        let repository = CryptoCurrencyRepository(apiDatasource: mockApiDataSource, errorMapper: mockErrorMapper, cacheDatasource: CryptoListFactory.createCacheDataSource())

        // WHEN
        let result = await repository.getCryptoList(currentPage: 0)

        // THEN
        switch result {
        case .success(let listCryptos):
            XCTAssertEqual(listCryptos.count, 3)
            XCTAssertEqual(listCryptos.first!.id, "1")
            XCTAssertEqual(listCryptos.first!.name, "testName1")
            XCTAssertEqual(listCryptos.first!.symbol, "sym1")
            XCTAssertEqual(listCryptos[1].id, "3")
            XCTAssertEqual(listCryptos[1].name, "testName3")
            XCTAssertEqual(listCryptos[1].symbol, "sym3")
            XCTAssertEqual(listCryptos[2].id, "2")
            XCTAssertEqual(listCryptos[2].name, "testName2")
            XCTAssertEqual(listCryptos[2].symbol, "sym2")
        case .failure(let error):
            XCTFail("Error: \(error)")
        }
    }

    func test_search() async throws {
        // GIVEN
        let mockApiDataSource = MockApiCryptoDataSource()
        let mockErrorMapper = MockCryptoCurrencyDomainErrorMapper()
        let repository = CryptoCurrencyRepository(apiDatasource: mockApiDataSource, errorMapper: mockErrorMapper, cacheDatasource: CryptoCurrency.CryptoListFactory.createCacheDataSource())

        // WHEN
        let result = await repository.search(searchText: "")

        // THEN
        switch result {
        case .success(let listCryptos):
            XCTAssertEqual(listCryptos.count, 3)
            XCTAssertEqual(listCryptos.first!.id, "1")
            XCTAssertEqual(listCryptos.first!.name, "testName1")
            XCTAssertEqual(listCryptos.first!.symbol, "sym1")
            XCTAssertEqual(listCryptos[1].id, "3")
            XCTAssertEqual(listCryptos[1].name, "testName3")
            XCTAssertEqual(listCryptos[1].symbol, "sym3")
            XCTAssertEqual(listCryptos[2].id, "2")
            XCTAssertEqual(listCryptos[2].name, "testName2")
            XCTAssertEqual(listCryptos[2].symbol, "sym2")
        case .failure(let error):
            XCTFail("Error: \(error)")
        }
    }
}
