//
//  WelcomeViewModel.swift
//  Validator
//
//  Created by Rafał Wojtuś on 15/11/2023.
//

import SwiftUI
import Combine
import OSLog

protocol WelcomeNavigation {
    func routeTo(_: WelcomeView.Routes)
}

extension WelcomeView {
    
    enum Routes {}
    
    @MainActor
    final class ViewModel: ObservableObject {
        
        typealias Dependencies = Any
        typealias Navigation = Any
        
        // MARK: - Properties
        
        private(set) var dependencies: Dependencies
        private(set) var navigation: Navigation
        
        // MARK: - UI Properties
        
        @Published var name: String
        
        // MARK: - Initialization
        
        init(dependencies: Dependencies, navigation: Navigation, name: String) {
            self.dependencies = dependencies
            self.navigation = navigation
            self.name = name
            Logger.memory.info("WelcomeViewModel Dependencies init")
        }
        
        deinit {
            Logger.memory.info("WelcomeViewModel Dependencies deinit")
        }
        
        // MARK: - Public implementation
        
        // MARK: - Private implementation
        
    }
    
}
