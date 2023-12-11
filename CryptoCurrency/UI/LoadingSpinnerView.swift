//
//  LoadingSpinnerView.swift
//  CryptoCurrency
//
//  Created by Edgar Guitian Rey on 7/12/23.
//

import SwiftUI

struct LoadingSpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
    }
}

#Preview {
    LoadingSpinnerView()
}
