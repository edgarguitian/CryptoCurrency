//
//  CryptoCurrencyPresentableErrorMapper.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 6/12/23.
//

import Foundation

class CryptoCurrencyPresentableErrorMapper {
    func map(error: CryptoCurrencyDomainError?) -> String {
        guard error == .tooManyRequests else {
            return "Something went wrong"
        }

        return "You have exceeded the limit. Try again later"
    }
}
