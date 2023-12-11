//
//  SwiftDataContainer.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation
import SwiftData

class SwiftDataContainer: SwiftDataContainerType {
    static let shared = SwiftDataContainer()

    private let container: ModelContainer?
    private let context: ModelContext?

    private init() {
        let scheme = Schema([CryptoCurrencyData.self])
        do {
            container = try ModelContainer(for: scheme, configurations: [])
            if let container = container {
                context = ModelContext(container)
            } else {
                context = nil
            }
        } catch {
            print("Error al crear el contenedor: \(error)")
            container = nil
            context = nil
        }
    }

    func fetchCryptos() -> [CryptoCurrencyData] {
        let descriptor = FetchDescriptor<CryptoCurrencyData>()

        guard let context = context, let cryptos = try? context.fetch(descriptor) else {
            return []
        }

        return cryptos
    }

    func insert(_ cryptoList: [CryptoCurrencyData]) async {
        if let context = context {
            cryptoList.forEach { crypto in
                context.insert(crypto)
            }

            try? context.save()
        }
    }
}
