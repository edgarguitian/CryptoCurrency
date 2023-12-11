//
//  SwiftDataContainerType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

protocol SwiftDataContainerType {
    func fetchCryptos() -> [CryptoCurrencyData]
    func insert(_ cryptoList: [CryptoCurrencyData]) async
}
