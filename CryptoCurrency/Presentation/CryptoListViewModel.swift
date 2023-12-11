//
//  CryptoListViewModel.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class CryptoListViewModel: ObservableObject {
    private let getCryptoList: GetCryptoListType
    private let searchCryptoList: SearchCryptoListType
    private let errorMapper: CryptoCurrencyPresentableErrorMapper
    private var currentPage: Int = 0
    @Published var cryptos: [CryptoListPresentableItem] = []
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    @Published var cryptoDetail: CryptoListPresentableItem?

    init(getCryptoList: GetCryptoListType,
         searchCryptoList: SearchCryptoListType,
         errorMapper: CryptoCurrencyPresentableErrorMapper) {
        self.getCryptoList = getCryptoList
        self.searchCryptoList = searchCryptoList
        self.errorMapper = errorMapper
    }

    func onAppear() {
        if currentPage == 0 {
            showLoadingSpinner = true
        }
        Task {
            let result = await getCryptoList.execute(currentPage: currentPage)
            handleResult(result, isSearch: false)
        }
    }

    func search(searchText: String) {
        Task {
            let result = await searchCryptoList.execute(searchText: searchText)
            handleResult(result, isSearch: true)
        }
    }

    private func handleResult(_ result: Result<[CryptoCurrencyMarket], CryptoCurrencyDomainError>, isSearch: Bool) {
        guard case .success(let cryptos) = result else {
            handleError(error: result.failureValue as? CryptoCurrencyDomainError)
            return
        }

        let cryptosPresentable = cryptos.map {
            CryptoListPresentableItem(id: $0.id, name: $0.name, symbol: $0.symbol, image: $0.image)
        }

        Task { @MainActor in
            if currentPage == 0 {
                showLoadingSpinner = false
            }
            if isSearch {
                self.cryptos = cryptosPresentable
            } else {
                self.cryptos.append(contentsOf: cryptosPresentable)
                currentPage += 1
            }
        }
    }

    private func handleError(error: CryptoCurrencyDomainError?) {
        Task { @MainActor in
            showLoadingSpinner = false
            showErrorMessage = errorMapper.map(error: error)
        }
    }
}
