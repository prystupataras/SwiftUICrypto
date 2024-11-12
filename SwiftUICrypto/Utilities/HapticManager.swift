//
//  HapticManager.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 12.11.2024.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
