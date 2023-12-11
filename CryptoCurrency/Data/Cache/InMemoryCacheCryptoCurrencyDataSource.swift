//
//  InMemoryCacheCryptoCurrencyDataSource.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

actor InMemoryCacheCryptoCurrencyDataSource: CacheCryptoCurrencyDataSourceType {
    static let shared: InMemoryCacheCryptoCurrencyDataSource = InMemoryCacheCryptoCurrencyDataSource()

    private var cache: [CryptoCurrencyMarket] = []

    private init() {}

    func getCryptoList() async -> [CryptoCurrencyMarket] {
        return cache
    }

    func saveCryptoList(_ cryptoList: [CryptoCurrencyMarket]) async {
        self.cache = cryptoList
    }
}
