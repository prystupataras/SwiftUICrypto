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
    
    init() {
        //change color for navigation bar
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
