//
//  AppCoordinatorViewModel.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import Foundation

extension AppCoordinator {
    
    final class ViewModel: ObservableObject {
        
        typealias Dependencies = AppDependencies
        
        // MARK: - Properties
        
        let dependencies: Dependencies
        
        // MARK: - Initialization
        
        init(dependencies: Dependencies) {
            self.dependencies = dependencies
        }
        
    }
    
}
