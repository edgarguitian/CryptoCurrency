//
//  CryptoDetailView.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import SwiftUI
import Charts

struct CryptoDetailView: View {
    @ObservedObject private var viewModel: CryptoDetailViewModel

    init(viewModel: CryptoDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            if viewModel.showLoadingSpinner {
                LoadingSpinnerView()
            } else {
                if viewModel.showErrorMessage == nil {
                    AsyncImage(url: URL(string: viewModel.cryptoDetailInfo.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                    }

                    Text(viewModel.cryptoDetailInfo.name)
                        .font(.title)

                    Text(viewModel.cryptoDetailInfo.symbol)
                        .font(.subheadline)

                    Spacer()

                    CryptoDetailItemView(title: "Price", value: viewModel.cryptoDetailInfo.price)
                    CryptoDetailItemView(title: "Price 24H", value: viewModel.cryptoDetailInfo.price24h)
                    CryptoDetailItemView(title: "Volume 24H", value: viewModel.cryptoDetailInfo.volume24h)
                    CryptoDetailItemView(title: "Market Cap", value: viewModel.cryptoDetailInfo.marketCap)

                    Spacer()
                } else {
                    Text(viewModel.showErrorMessage!)
                }
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}
