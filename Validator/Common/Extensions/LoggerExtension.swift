//
//  LoggerExtension.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import Foundation
import OSLog

typealias Log = Logger

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!
    
    static let memory = Logger(subsystem: subsystem, category: "memory")
    
}
