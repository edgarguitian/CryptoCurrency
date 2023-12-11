//
//  CryptoDetailItemView.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 8/12/23.
//

import SwiftUI

struct CryptoDetailItemView: View {
    let title: String
    let value: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .lineLimit(1)

            Spacer()

            Text(value)
                .font(.title2)
                .lineLimit(1)

        }
        .padding()
        .background(Color("BackgroundItemColor"))
        .cornerRadius(10)
    }
}

#Preview {
    CryptoDetailItemView(title: "Price", value: "0.01")
}
