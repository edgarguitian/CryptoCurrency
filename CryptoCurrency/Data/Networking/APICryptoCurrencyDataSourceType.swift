//
//  APICryptoCurrencyDataSourceType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

// MARK: interfaz de networking de Data que hará todas las llamadas separadas al api
protocol APICryptoCurrencyDataSourceType {
    func getCryptoList() async -> Result<[CryptoCurrencyListDTO], HTTPClientError>
    func getCryptoListMarket(cryptosListId ids: [String]) async -> Result<[CryptoCurrencyMarketDTO], HTTPClientError>
}
