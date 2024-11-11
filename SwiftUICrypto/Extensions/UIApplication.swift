//
//  UIApplication.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 11.11.2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
