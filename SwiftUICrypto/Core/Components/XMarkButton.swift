//
//  XMarkButton.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 11.11.2024.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
        })
    }
}

#Preview {
    XMarkButton()
}
