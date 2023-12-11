//
//  StrategyCacheCryptoCurrency.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class StrategyCacheCryptoCurrency: CacheCryptoCurrencyDataSourceType {
    private let temporalCache: CacheCryptoCurrencyDataSourceType
    private let persistanceCache: CacheCryptoCurrencyDataSourceType

    init(temporalCache: CacheCryptoCurrencyDataSourceType, persistanceCache: CacheCryptoCurrencyDataSourceType) {
        self.temporalCache = temporalCache
        self.persistanceCache = persistanceCache
    }

    func getCryptoList() async -> [CryptoCurrencyMarket] {
        let temporalCryptoList = await temporalCache.getCryptoList()

        if !temporalCryptoList.isEmpty {
            return temporalCryptoList
        }

        let persitanceCryptoList = await persistanceCache.getCryptoList()
        await temporalCache.saveCryptoList(persitanceCryptoList)

        return persitanceCryptoList
    }

    func saveCryptoList(_ cryptoList: [CryptoCurrencyMarket]) async {
        await temporalCache.saveCryptoList(cryptoList)
        await persistanceCache.saveCryptoList(cryptoList)
    }
}
