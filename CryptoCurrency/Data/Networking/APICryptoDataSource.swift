//
//  APICryptoDataSource.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class APICryptoDataSource: APICryptoCurrencyDataSourceType {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getCryptoList() async -> Result<[CryptoCurrencyListDTO], HTTPClientError> {
        let endpoint = Endpoint(path: "coins/list",
                                queryParameters: [:],
                                method: .get)

        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://api.coingecko.com/api/v3/")

        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }

        guard let cryptoList = try? JSONDecoder().decode([CryptoCurrencyListDTO].self, from: data) else {
            return .failure(.parsingError)
        }
        return .success(cryptoList)
    }

    func getCryptoListMarket(cryptosListId ids: [String]) async -> Result<[CryptoCurrencyMarketDTO], HTTPClientError> {

        let queryParameters: [String: Any] = [
            "vs_currency": "eur",
            "ids": ids.joined(separator: ","),
            "order": "id_desc",
            "per_page": 250,
            "page": 1,
            "sparkline": false,
            "locale": "en"
        ]

        let endpoint = Endpoint(path: "coins/markets",
                                queryParameters: queryParameters,
                                method: .get)

        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://api.coingecko.com/api/v3/")

        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }

        guard let cryptoList = try? JSONDecoder().decode([CryptoCurrencyMarketDTO].self, from: data) else {
            return .failure(.parsingError)
        }
        return .success(cryptoList)
    }

    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }

        return error
    }
}
