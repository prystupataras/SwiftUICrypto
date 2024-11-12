//
//  Detailview.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 12.11.2024.
//

import SwiftUI

struct DetailLoadingView : View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                Detailview(coin: coin)
            }
        }
    }
}

struct Detailview: View {
    
    let coin: CoinModel
    
    init(coin:CoinModel) {
        self.coin = coin
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    Detailview(coin: DeveloperPreview.dev.coin)
}
