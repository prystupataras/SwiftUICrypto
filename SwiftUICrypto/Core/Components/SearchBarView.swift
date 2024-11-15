//
//  SearchBarView.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 11.11.2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ?
                        .secondaryApp : .accent
                )
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundStyle(.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.backgroundApp)
                .shadow(color: .accent.opacity(0.15),
                        radius: 10)
        )
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        SearchBarView(searchText: .constant(""))
            .colorScheme(.light)
        SearchBarView(searchText: .constant(""))
            .colorScheme(.dark)
    }
}
