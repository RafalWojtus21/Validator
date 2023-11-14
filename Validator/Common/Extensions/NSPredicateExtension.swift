//
//  NSPredicateExtension.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import Foundation

extension NSPredicate {
    
    static func matchPredicate(regex: Validation.ValidationType.RegexPatterns) -> NSPredicate {
        return NSPredicate(format: "SELF MATCHES %@", regex.rawValue)
    }

    static func agePredicate(minAge: Int) -> NSPredicate {
        return NSPredicate { (evaluatedObject, _) in
            guard let birthDate = evaluatedObject as? Date else {
                return false
            }
            let calendar = Calendar.current
            let currentDate = Date()
            let components = calendar.dateComponents([.year], from: birthDate, to: currentDate)
            
            return (components.year ?? 0) >= minAge
        }
    }
}
