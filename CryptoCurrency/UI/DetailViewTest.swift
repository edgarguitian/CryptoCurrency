//
//  DetailViewTest.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 8/12/23.
//

import SwiftUI

struct DetailViewTest: View {
    let item: CryptoCurrencyPricePresentableItem
    var body: some View {
        AsyncImage(url: URL(string: item.image)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
        } placeholder: {
            ProgressView()
        }

        Text(item.name)
            .font(.title)

        Text(item.symbol)
            .font(.subheadline)

        Spacer()

        CryptoDetailItemView(title: "Price", value: item.price)
        CryptoDetailItemView(title: "Price 24H", value: item.price24h)
        CryptoDetailItemView(title: "Volume 24H", value: item.volume24h)
        CryptoDetailItemView(title: "Market Cap", value: item.marketCap)

        Spacer()
    }
}

#Preview {
    DetailViewTest(item: item)
}

let imageItem = "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400"
let item = CryptoCurrencyPricePresentableItem(domainModelInfo:
                                                CryptoListPresentableItem(
                                                    id: "1",
                                                    name: "Bitcoin",
                                                    symbol: "btc",
                                                    image: imageItem),
                                              domainModelPrice:
                                                CryptoCurrencyPrice(
                                                    price: 0.01,
                                                    price24h: 0.02,
                                                    volume24h: 0.03,
                                                    marketCap: 0.04))
