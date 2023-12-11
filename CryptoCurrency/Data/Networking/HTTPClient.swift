//
//  HTTPCLient.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HTTPClientError>
}
