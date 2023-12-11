//
//  CreateCryptoDetailView.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

protocol CreateCryptoDetailView {
    func create(cryptoCurrency: CryptoListPresentableItem) -> CryptoDetailView
}
