//
//  CircleButtonView.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 07.11.2024.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(.backgroundApp)
            )
            .shadow(
                color: .accent,
                radius: 10
            )
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(iconName: "info")
    }
    
}
