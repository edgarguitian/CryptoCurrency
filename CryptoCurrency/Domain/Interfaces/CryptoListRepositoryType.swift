//
//  CryptoListRepositoryType.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

// MARK: interfaz para conectar el caso de uso de obtener las cryptocurrency de la capa de dominio con la capa de data
protocol CryptoListRepositoryType {
    func getCryptoList(currentPage: Int) async -> Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError>
}
