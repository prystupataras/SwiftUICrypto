//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 07.11.2024.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
