//
//  AppCoordinator.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI

struct AppCoordinator: View {
    
    @StateObject var viewModel: ViewModel
    @StateObject var navigation: Navigation
    
    var body: some View {
        MainCoordinator(viewModel: .init(dependencies: viewModel.dependencies, navigation: navigation))
    }
    
}

#Preview {
    AppCoordinator(viewModel: .init(dependencies: MockedDependencies()),
                   navigation: .init(dependencies: MockedDependencies()))
}


fileprivate struct MockedDependencies: AppDependencies {}
