//
//  Equatable.swift
//  CryptoCurrencyTests
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation
@testable import CryptoCurrency

extension CryptoCurrencyMarket: Equatable {
    public static func == (lhs: CryptoCurrencyMarket, rhs: CryptoCurrencyMarket) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
        && lhs.symbol == rhs.symbol
    }
}

extension CryptoCurrencyPrice: Equatable {
    public static func == (lhs: CryptoCurrencyPrice, rhs: CryptoCurrencyPrice) -> Bool {
        return lhs.price == rhs.price
        && lhs.price24h == rhs.price24h
        && lhs.volume24h == rhs.volume24h
        && lhs.marketCap == rhs.marketCap
    }
}
