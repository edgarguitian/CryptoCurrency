//
//  CacheCryptoCurrencyDataSourceType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

protocol CacheCryptoCurrencyDataSourceType {
    func getCryptoList() async -> [CryptoCurrencyMarket]
    func saveCryptoList(_ cryptoList: [CryptoCurrencyMarket]) async
}
