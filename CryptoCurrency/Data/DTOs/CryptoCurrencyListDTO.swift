//
//  CryptoCurrencyListDTO.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 8/12/23.
//

import Foundation

// MARK: DTO para obtener el listado de cryptos
struct CryptoCurrencyListDTO: Codable {
    let id: String
    let symbol: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name
    }
}
