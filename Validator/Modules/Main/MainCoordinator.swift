//
//  MainCoordinator.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI

struct MainCoordinator: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: ViewModel
    
    // MARK: - User Interface
    
    var body: some View {
        UserInfoView(viewModel: .init(dependencies: viewModel.dependencies, navigation: viewModel))
    }
    
}

struct MainCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        MainCoordinator(viewModel: .init(dependencies: MockedDependencies(), navigation: MockedNavigation()))
    }
}

fileprivate struct MockedDependencies: MainCoordinator.ViewModel.Dependencies {}

fileprivate struct MockedNavigation {}
