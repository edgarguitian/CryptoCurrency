//
//  CryptoDetailViewModel.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class CryptoDetailViewModel: ObservableObject {
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    @Published var cryptoDetailInfo: CryptoCurrencyPricePresentableItem

    private let getCryptoPrice: GetCryptoPrice
    private let errorMapper: CryptoCurrencyPresentableErrorMapper
    let cryptoCurrencyInfoItem: CryptoListPresentableItem

    init(getCryptoPrice: GetCryptoPrice,
         errorMapper: CryptoCurrencyPresentableErrorMapper,
         cryptoCurrency: CryptoListPresentableItem) {
        self.getCryptoPrice = getCryptoPrice
        self.errorMapper = errorMapper
        self.cryptoCurrencyInfoItem = cryptoCurrency
        self.cryptoDetailInfo = CryptoCurrencyPricePresentableItem()
    }

    func onAppear() {
        showLoadingSpinner = true
        showErrorMessage = nil
        Task {
            let result = await getCryptoPrice.execute(id: cryptoCurrencyInfoItem.id)

            guard case .success(let cryptoPrice) = result else {
                handleError(error: result.failureValue as? CryptoCurrencyDomainError)
                return
            }

            let cryptoPresentable = CryptoCurrencyPricePresentableItem(
                domainModelInfo: cryptoCurrencyInfoItem,
                domainModelPrice: cryptoPrice)

            Task { @MainActor in
                showLoadingSpinner = false
                self.cryptoDetailInfo = cryptoPresentable
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
