//
//  APICryptoDataSourceTests.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import XCTest
@testable import CryptoCurrency

final class APICryptoDataSourceTests: XCTestCase {
    
    func test_getCryptoList_success() async throws {
        // GIVEN
        let mockHttpClient = MockHTTPClient()
        let apiCryptoDataSource = APICryptoDataSource(httpClient: mockHttpClient)
        
        
        let mockData = [ CryptoCurrencyListDTO(id: "1", symbol: "sym1", name: "testName1"),
                         CryptoCurrencyListDTO(id: "2", symbol: "sym2", name: "testName2"),
                         CryptoCurrencyListDTO(id: "3", symbol: "sym3", name: "testName3")
        ]
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(mockData)
            
            mockHttpClient.mockResult = .success(jsonData)
            
            // WHEN
            let result = await apiCryptoDataSource.getCryptoList()
            
            // THEN
            switch result {
            case .success(let listCryptos):
                XCTAssertEqual(listCryptos.count, 3)
                XCTAssertEqual(listCryptos.first!.id, "1")
                XCTAssertEqual(listCryptos.first!.name, "testName1")
                XCTAssertEqual(listCryptos.first!.symbol, "sym1")
                XCTAssertEqual(listCryptos[1].id, "2")
                XCTAssertEqual(listCryptos[1].name, "testName2")
                XCTAssertEqual(listCryptos[1].symbol, "sym2")
                XCTAssertEqual(listCryptos[2].id, "3")
                XCTAssertEqual(listCryptos[2].name, "testName3")
                XCTAssertEqual(listCryptos[2].symbol, "sym3")
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        } catch {
            XCTFail("Error: \(error)")
        }
        
        
    }
    
    func test_getCryptoListMarket_success() async throws {
        // GIVEN
        let mockHttpClient = MockHTTPClient()
        let apiCryptoDataSource = APICryptoDataSource(httpClient: mockHttpClient)
        
        
        let mockData = [ CryptoCurrencyMarketDTO(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "testImage1")
        ]
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(mockData)
            
            mockHttpClient.mockResult = .success(jsonData)
            
            // WHEN
            let result = await apiCryptoDataSource.getCryptoListMarket(cryptosListId: ["bitcoin"])
            
            // THEN
            switch result {
            case .success(let cryptoMarket):
                XCTAssertEqual(cryptoMarket.count, 1)
                XCTAssertEqual(cryptoMarket.first!.id, "bitcoin")
                XCTAssertEqual(cryptoMarket.first!.name, "Bitcoin")
                XCTAssertEqual(cryptoMarket.first!.symbol, "btc")
                XCTAssertEqual(cryptoMarket.first!.image, "testImage1")
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        } catch {
            XCTFail("Error: \(error)")
        }
        
        
    }
}
