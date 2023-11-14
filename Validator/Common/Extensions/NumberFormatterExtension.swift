//
//  NumberFormatterExtension.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import Foundation

extension NumberFormatter {
    
    static var defaultDecimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
