//
//  CryptoListFactory.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class CryptoListFactory {
    static func create() -> CryptoListView {
        return CryptoListView(viewModel: createViewModel(),
                              createCryptoDetailView: CryptoDetailFactory())
    }

    private static func createViewModel() -> CryptoListViewModel {
        return CryptoListViewModel(getCryptoList: createGetCryptoListUseCase(),
                                   searchCryptoList: createSearchCryptoListUseCase(),
                                   errorMapper: CryptoCurrencyPresentableErrorMapper())
    }

    private static func createGetCryptoListUseCase() -> GetCryptoListType {
        return GetCryptoList(repository: createRepository())
    }

    private static func createSearchCryptoListUseCase() -> SearchCryptoListType {
        return SearchCryptoList(repository: createRepository())
    }

    private static func createRepository() -> CryptoCurrencyRepository {
        return CryptoCurrencyRepository(apiDatasource: createAPIDataSource(),
                                                 errorMapper: CryptoCurrencyDomainErrorMapper(),
                                                 cacheDatasource: createCacheDataSource())
    }

    static func createCacheDataSource() -> CacheCryptoCurrencyDataSourceType {
        return StrategyCacheCryptoCurrency(temporalCache: InMemoryCacheCryptoCurrencyDataSource.shared,
                                             persistanceCache: createPersistanceCacheDataSource())
    }

    private static func createPersistanceCacheDataSource() -> CacheCryptoCurrencyDataSourceType {
        return SwiftDataCacheDataSource(container: SwiftDataContainer.shared)
    }

    private static func createAPIDataSource() -> APICryptoCurrencyDataSourceType {
        return APICryptoDataSource(httpClient: createHTTPClient())
    }

    private static func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
}
