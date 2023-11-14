//
//  AppCoordinatorNavigation.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//
import Foundation

extension AppCoordinator {
    
    final class Navigation: ObservableObject, MainCoordinatorNavigation {
        
        typealias Dependencies = Any
        
        // MARK: - Properties
        
        private let dependencies: Dependencies
        
        // MARK: - Initialization
        
        init(dependencies: Dependencies) {
            self.dependencies = dependencies
        }
        
        // MARK: - MainCoordinatorNavigation
        
        func routeTo(_ destination: MainCoordinator.CoordinatorRoutes) {}
        
    }
    
}
