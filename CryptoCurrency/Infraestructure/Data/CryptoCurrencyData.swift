//
//  CryptoCurrencyData.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation
import SwiftData

@Model
class CryptoCurrencyData {
    let id: String
    let name: String
    let symbol: String
    let image: String

    init(id: String, name: String, symbol: String, image: String) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.image = image
    }
}
