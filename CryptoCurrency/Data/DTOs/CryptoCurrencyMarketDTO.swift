//
//  CryptoCurrencyMarketDTO.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

// MARK: DTO para obtener la market crypto con la imagen
struct CryptoCurrencyMarketDTO: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
    }
}
