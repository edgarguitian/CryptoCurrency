//
//  MockApiCryptoDataSource.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 8/12/23.
//

import Foundation
@testable import CryptoCurrency

class MockApiCryptoDataSource: APICryptoCurrencyDataSourceType {
    func getCryptoList() async -> Result<[CryptoCurrencyListDTO], HTTPClientError> {
        let mockArray = [
            CryptoCurrencyListDTO(id: "1", symbol: "sym1", name: "testName1"),
            CryptoCurrencyListDTO(id: "2", symbol: "sym2", name: "testName2"),
            CryptoCurrencyListDTO(id: "3", symbol: "sym3", name: "testName3")
        ]

        return .success(mockArray)
    }
    
    func getCryptoListMarket(cryptosListId ids: [String]) async -> Result<[CryptoCurrencyMarketDTO], HTTPClientError> {
        let mockArray = [
            CryptoCurrencyMarketDTO(id: "1", symbol: "sym1", name: "testName1", image: "image1"),
            CryptoCurrencyMarketDTO(id: "2", symbol: "sym2", name: "testName2", image: "image2"),
            CryptoCurrencyMarketDTO(id: "3", symbol: "sym3", name: "testName3", image: "image3")
        ]

        return .success(mockArray)
    }
}
