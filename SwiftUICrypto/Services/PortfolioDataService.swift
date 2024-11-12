//
//  PortfolioDataService.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 12.11.2024.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "Portfolio"
    
    @Published var savedEntities: [Portfolio] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error {
                print("Failed to load Core Data stores: \(error)")
            }
            self.getPortfolio()
        }
    }
    
    //MARK: Public
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        //check if already exist in portfolio
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            if  amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    //MARK: Private
    
    private func getPortfolio() {
        let request = NSFetchRequest<Portfolio>(entityName: entityName)
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("Failed to fetch portfolio: \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = Portfolio(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: Portfolio, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: Portfolio) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch {
            print("Failed to save portfolio: \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getPortfolio()
    }
    
}
