//
//  ApiPriceDataSourceType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

protocol ApiPriceDataSourceType {
    func getPriceForCryptos(cryptoId: [String]) async -> Result<[String: CryptoCurrencyPriceDTO], HTTPClientError>
}
