//
//  ValidatorApp.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI

@main
struct ValidatorApp: App {
    
    private let dependencies: ValidatorAppDependencies = .init()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinator(viewModel: .init(dependencies: dependencies), navigation: .init(dependencies: dependencies))
        }
    }
}
