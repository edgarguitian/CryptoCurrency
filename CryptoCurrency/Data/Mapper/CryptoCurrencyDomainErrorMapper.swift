//
//  CryptoCurrencyDomainErrorMapper.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

// MARK: componente que convierte un error de tipo HttpClient a un error de tipo dominio
class CryptoCurrencyDomainErrorMapper {
    func map(error: HTTPClientError?) -> CryptoCurrencyDomainError {
        guard error == .tooManyRequests else {
            return .generic
        }

        return .tooManyRequests
    }
}
