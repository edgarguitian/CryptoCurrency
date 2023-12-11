//
//  APIPriceDataSource.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import Foundation

class APIPriceDataSource: ApiPriceDataSourceType {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getPriceForCryptos(cryptoId id: [String]) async -> Result<[String: CryptoCurrencyPriceDTO], HTTPClientError> {
        let queryParameters: [String: Any] = [
            "ids": id.joined(separator: ","),
            "vs_currencies": "eur",
            "include_market_cap": true,
            "include_24hr_vol": true,
            "include_24hr_change": true
        ]

        let endpoint = Endpoint(path: "simple/price",
                                queryParameters: queryParameters,
                                method: .get)

        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://api.coingecko.com/api/v3/")

        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }

        guard let cryptoList = try? JSONDecoder().decode([String: CryptoCurrencyPriceDTO].self, from: data) else {
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
