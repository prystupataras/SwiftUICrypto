//
//  CoinImageService.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 11.11.2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getGoinImage()
    }
    
    private func getGoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            // load from cache
            image = savedImage
        } else {
            //download from network
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard
                    let self = self,
                    let downloadImage = returnedImage
                else { return }
                self.image = returnedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImages(image: downloadImage, imageName: imageName, folderName: folderName)
            })
    }
}
