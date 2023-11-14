//
//  UserInfoViewModel.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI
import Combine
import OSLog

protocol UserInfoNavigation {
    func routeTo(_: UserInfoView.Routes)
}

extension UserInfoView {
    
    enum Routes {}
    
    @MainActor
    final class ViewModel: ObservableObject {
        
        typealias Dependencies = Any
        typealias Navigation = Any
        
        // MARK: - Properties
        
        private(set) var dependencies: Dependencies
        private(set) var navigation: Navigation
        
        // MARK: - UI Properties
        
        // MARK: - Initialization
        
        init(dependencies: Dependencies, navigation: Navigation) {
            self.dependencies = dependencies
            self.navigation = navigation
            Logger.memory.info("UserInfoViewModel Dependencies init")
        }
        
        deinit {
//            Logger.memory.info("UserInfoViewModel Dependencies deinit")
        }
        
        // MARK: - Public implementation
        
        // MARK: - Private implementation
        
    }
    
}
