//
//  MockApiPriceDataSource.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 8/12/23.
//

import Foundation
@testable import CryptoCurrency

class MockApiPriceDataSource: ApiPriceDataSourceType {
    func getPriceForCryptos(cryptoId: [String]) async -> Result<[String : CryptoCurrencyPriceDTO], HTTPClientError> {
        let priceInfo = CryptoCurrencyPriceDTO(price: 40763, marketCap: 49000.0, volume24h: 1000000.0, price24h: 900000000000.0)
        return .success([cryptoId.first!: priceInfo])
    }
}
