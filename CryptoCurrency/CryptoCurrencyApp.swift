//
//  CryptoCurrencyApp.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import SwiftUI

@main
struct CryptoCurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            CryptoListFactory.create()
        }
    }
}
