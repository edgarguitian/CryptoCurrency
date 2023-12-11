//
//  SwiftDataCacheDataSource.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class SwiftDataCacheDataSource: CacheCryptoCurrencyDataSourceType {
    private let container: SwiftDataContainerType

    init(container: SwiftDataContainerType) {
        self.container = container
    }

    func getCryptoList() async -> [CryptoCurrencyMarket] {
        let cryptoList = container.fetchCryptos()
        return cryptoList.map { CryptoCurrencyMarket(id: $0.id, symbol: $0.symbol, name: $0.name, image: $0.image) }
    }

    func saveCryptoList(_ cryptoList: [CryptoCurrencyMarket]) async {
        let cryptoListData = cryptoList.map {
            CryptoCurrencyData(id: $0.id, name: $0.name, symbol: $0.symbol, image: $0.image)
        }
        await container.insert(cryptoListData)
    }
}
