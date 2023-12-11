//
//  CryptoListView.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import SwiftUI

struct CryptoListView: View {
    @ObservedObject private var viewModel: CryptoListViewModel
    private let createCryptoDetailView: CreateCryptoDetailView
    @State private var searchCryptoText: String = ""

    init(viewModel: CryptoListViewModel, createCryptoDetailView: CreateCryptoDetailView) {
        self.viewModel = viewModel
        self.createCryptoDetailView = createCryptoDetailView
    }

    var body: some View {
        VStack {
            if viewModel.showLoadingSpinner {
                LoadingSpinnerView()
            } else {
                if viewModel.showErrorMessage == nil {
                    NavigationStack {
                        List {
                            ForEach(viewModel.cryptos, id: \.id) { cryptoItem in
                                NavigationLink {
                                    createCryptoDetailView.create(cryptoCurrency: cryptoItem)
                                } label: {
                                    CryptoListItemView(item: cryptoItem)
                                }.onAppear {
                                    loadMoreCryptosIfNeeded(currentCrypto: cryptoItem)
                                }
                            }
                        }
                        .navigationTitle("List Cryptos")
                        .accessibilityIdentifier("listCryptos")

                    }.searchable(text: $searchCryptoText).onChange(of: searchCryptoText) { _, newValue in
                        viewModel.search(searchText: newValue)
                    }
                } else {
                    Text(viewModel.showErrorMessage!)
                }
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }

    func loadMoreCryptosIfNeeded(currentCrypto: CryptoListPresentableItem) {
        Task {
            print("Last: "+"\(viewModel.cryptos.last!.id)")
            print("Current: "+"\(currentCrypto.id)")
            if currentCrypto == viewModel.cryptos.last {
                viewModel.onAppear()
            }
        }
    }
}
