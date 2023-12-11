//
//  CryptoListItemView.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import SwiftUI

struct CryptoListItemView: View {
    let item: CryptoListPresentableItem

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
            } placeholder: {
                ProgressView()
            }

            Text(item.name)
                .font(.title2)
                .lineLimit(1)

            Spacer()
        }.padding()
    }
}

#Preview {
    CryptoListItemView(item: CryptoListPresentableItem(
        id: "1",
        name: "Bitcoin",
        symbol: "btc",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400"))
}
