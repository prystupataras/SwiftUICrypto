//
//  CoinDetailDataService.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 12.11.2024.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    private var decoder: JSONDecoder = .init()
    
    init(coin: CoinModel) {
        self.coin = coin
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        getCoinDetail()
    }
    
    private func getCoinDetail() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: decoder)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinDetails in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}
