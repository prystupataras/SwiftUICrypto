//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 07.11.2024.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    init() {
        //change color for navigation bar
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.accent)]
        
        UITableView.appearance().backgroundColor = .backgroundApp
//        UITableViewHeaderFooterView.appearance().backgroundColor = .clear
//        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                NavigationStack {
                    HomeView()
                }
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
