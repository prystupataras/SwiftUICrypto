//
//  SettingsView.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 15.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/prystupataras")!
    
    var body: some View {
        NavigationStack {
            List {
                coinGeckoSection
                developerSection
                applicationSection
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(dismiss: _dismiss)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}


extension SettingsView {
    
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryprocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        } header: {
            Text("CoinGecko")
        }
    }
    
    private var developerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("developer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Taras Prystupa. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publisher/subscribers and data persistence.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.accent)
            }
            .padding(.vertical)
            Link("Visit GitHub 🤓", destination: personalURL)
        } header: {
            Text("Developer")
        }
    }
    
    private var applicationSection: some View {
        
        Section {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
            
        } header: {
            Text("Application")
        }
    }
}
