//
//  CircleButtonAnimationView.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 07.11.2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(CGFloat(animate ? 1.0 : 0))
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width: 100, height:  100)
        
}
