//
//  CryptoDetailFactory.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class CryptoDetailFactory: CreateCryptoDetailView {
    func create(cryptoCurrency cryptoCurrencyItem: CryptoListPresentableItem) -> CryptoDetailView {
        return CryptoDetailView(viewModel: createViewModel(cryptoCurrency: cryptoCurrencyItem))
    }

    func createViewModel(cryptoCurrency: CryptoListPresentableItem) -> CryptoDetailViewModel {
        return CryptoDetailViewModel(getCryptoPrice: createUseCase(),
                                     errorMapper: CryptoCurrencyPresentableErrorMapper(),
                                     cryptoCurrency: cryptoCurrency)
    }

    private func createUseCase() -> GetCryptoPrice {
        return GetCryptoPrice(repository: createRepository())
    }

    private func createRepository() -> CryptoCurrencyPriceRepositoryType {
        return CryptoCurrencyPriceRepository(apiDataSource: createDataSource(),
                                             errorMapper: CryptoCurrencyDomainErrorMapper())
    }

    private func createDataSource() -> ApiPriceDataSourceType {
        return APIPriceDataSource(httpClient: createHTTPClient())
    }

    private func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
}
