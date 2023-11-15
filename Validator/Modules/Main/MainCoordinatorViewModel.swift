//
//  MainCoordinatorViewModel.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI
import OSLog

protocol MainCoordinatorNavigation {
    func routeTo(_: MainCoordinator.CoordinatorRoutes)
}

extension MainCoordinator {
    
    enum CoordinatorRoutes {}
    
    final class ViewModel: ObservableObject, UserInfoNavigation {
        
        enum Routes: Hashable {
            case welcomeScreen(name: String)
        }
        
        typealias Dependencies = Any
        typealias CoordinatorNavigation = Any
        typealias AllExtendedDependencies = Any
        
        final class ExtendedDependencies: Dependencies, AllExtendedDependencies  {
            private let dependencies: Dependencies
            
            init(dependencies: Dependencies, navigation: CoordinatorNavigation) {
                self.dependencies = dependencies
            }
        }
        
        // MARK: - Properties
        
        @Published var navigationPath: [Routes] = []
        
        let coordinatorNavigation: CoordinatorNavigation
        let dependencies: Dependencies
        
        lazy var extendedDependencies = ExtendedDependencies(dependencies: dependencies, navigation: coordinatorNavigation)
        
        init(dependencies: Dependencies, navigation: CoordinatorNavigation) {
            self.dependencies = dependencies
            self.coordinatorNavigation = navigation
            Logger.memory.info("MainCoordinator Dependencies init")
        }
        
        deinit {
            Logger.memory.info("MainCoordinator Dependencies deinit")
        }
        
        // MARK: - Public implementation
        
        func routeTo(_ destination: UserInfoView.Routes) {
            switch destination {
            case .welcomeScreen(let name):
                navigationPath.append(.welcomeScreen(name: name))
            }
        }
        
        // MARK: - Private implementation
        
    }
    
}
