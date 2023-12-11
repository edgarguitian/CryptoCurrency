//
//  CryptoCurrencyPricePresentableItem.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

struct CryptoCurrencyPricePresentableItem {
    let name: String
    let symbol: String
    let image: String
    let price: String
    let price24h: String
    let volume24h: String
    let marketCap: String
    let isPriceChangePositive: Bool

    init() {
        self.name = ""
        self.symbol = ""
        self.image = ""
        self.price = ""
        self.price24h = ""
        self.volume24h = ""
        self.marketCap = ""
        self.isPriceChangePositive = false
    }

    init(domainModelInfo: CryptoListPresentableItem, domainModelPrice: CryptoCurrencyPrice) {
        self.name = domainModelInfo.name
        self.symbol = domainModelInfo.symbol
        self.image = domainModelInfo.image
        self.price = domainModelPrice.price.toCurrency() ?? "-"
        self.price24h = domainModelPrice.price24h != nil ? String(format: "%.2f", domainModelPrice.price24h!) + " %" : "-"
        self.volume24h = domainModelPrice.volume24h != nil ? (domainModelPrice.volume24h?.toCurrency() ?? "-") : "-"
        self.marketCap = domainModelPrice.marketCap.toCurrency() ?? "-"
        self.isPriceChangePositive = (domainModelPrice.price24h ?? 0) >= 0
    }
}

extension CryptoCurrencyPricePresentableItem: Hashable {

}
