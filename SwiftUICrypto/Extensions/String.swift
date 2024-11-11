//
//  String.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 11.11.2024.
//

import Foundation

extension String {
    var preparedToDecimalNumberConversion: String {
        split {
            !CharacterSet(charactersIn: "\($0)").isSubset(of: CharacterSet.decimalDigits)
        }.joined(separator: ".")
    }
}
