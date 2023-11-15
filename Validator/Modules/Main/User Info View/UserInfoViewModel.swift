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
    
    enum Routes {
        case welcomeScreen(name: String)
    }
    
    @MainActor
    final class ViewModel: ObservableObject {
        
        typealias Dependencies = Any
        typealias Navigation = UserInfoNavigation
        
        // MARK: - Properties
        
        private(set) var dependencies: Dependencies
        private(set) var navigation: Navigation
        
        // MARK: - UI Properties
        
        @Published var userName = ""
        @Published var age = ""
        @Published var height = ""
        var userSetup: UserConfig
        var personalDetails: UserConfig
        
        // MARK: - Initialization
        
        init(dependencies: Dependencies, navigation: Navigation, userSetup: UserConfig, personalDetails: UserConfig) {
            self.dependencies = dependencies
            self.navigation = navigation
            self.userSetup = userSetup
            self.personalDetails = personalDetails
            Logger.memory.info("UserInfoViewModel Dependencies init")
        }
        
        deinit {
            Logger.memory.info("UserInfoViewModel Dependencies deinit")
        }
        
        // MARK: - Public implementation
        
        func routeToWelcomeScreen() {
            navigation.routeTo(.welcomeScreen(name: "Temporary name"))
        }
        
        // MARK: - Private implementation
        
    }
    
}
