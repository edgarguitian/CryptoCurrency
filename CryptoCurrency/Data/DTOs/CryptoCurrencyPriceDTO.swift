//
//  CryptoCurrencyPriceDTO.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

// MARK: DTO para obtener el precio de una crypto
struct CryptoCurrencyPriceDTO: Codable {
    let price: Double
    let marketCap: Double
    let volume24h: Double?
    let price24h: Double?

    enum CodingKeys: String, CodingKey {
        case price = "eur"
        case marketCap = "eur_market_cap"
        case volume24h = "eur_24h_vol"
        case price24h = "eur_24h_change"
    }
}
