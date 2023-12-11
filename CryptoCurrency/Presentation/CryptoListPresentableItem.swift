//
//  CryptoListPresentableItem.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

struct CryptoListPresentableItem {
    let id: String
    let name: String
    let symbol: String
    let image: String
}

extension CryptoListPresentableItem: Hashable {

}
