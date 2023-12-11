//
//  APIPriceDataSourceTests.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 8/12/23.
//

import XCTest
@testable import CryptoCurrency

final class APIPriceDataSourceTests: XCTestCase {
    
    func test_getPriceForCryptos_success() async throws {
        // GIVEN
        let mockHttpClient = MockHTTPClient()
        let apiPriceDataSource = APIPriceDataSource(httpClient: mockHttpClient)
        
        
        let mockData = [ "bitcoin": CryptoCurrencyPriceDTO(price: 0.01, marketCap: 0.02, volume24h: 0.03, price24h: 0.04)]
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(mockData)
            
            mockHttpClient.mockResult = .success(jsonData)
            
            // WHEN
            let result = await apiPriceDataSource.getPriceForCryptos(cryptoId: ["bitcoin"])
            
            // THEN
            switch result {
            case .success(let cryptoList):
                XCTAssertEqual(cryptoList.count, 1)
                XCTAssertEqual(cryptoList["bitcoin"]!.price, 0.01)
                XCTAssertEqual(cryptoList["bitcoin"]!.marketCap, 0.02)
                XCTAssertEqual(cryptoList["bitcoin"]!.volume24h, 0.03)
                XCTAssertEqual(cryptoList["bitcoin"]!.price24h, 0.04)
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        } catch {
            XCTFail("Error: \(error)")
        }
        
        
    }
}
