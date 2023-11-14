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
    
    private let userSetup: [UserInfo] = [
        .init(type: .string, description: "Name"),
        .init(type: .string, description: "E-mail")
    ]
    
    private let personalDetails: [UserInfo] = [
        .init(type: .date, description: "Date of birth"),
        .init(type: .integer, description: "Height")
    ]
    
    // MARK: - User Interface
    
    var body: some View {
        NavigationStack {
            UserInfoView(viewModel: .init(dependencies: viewModel.dependencies, 
                                          navigation: viewModel,
                                          userSetup: .init(info: userSetup), 
                                          personalDetails: .init(info: personalDetails)))
        }
    }
    
}

struct MainCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        MainCoordinator(viewModel: .init(dependencies: MockedDependencies(), navigation: MockedNavigation()))
    }
}

fileprivate struct MockedDependencies: MainCoordinator.ViewModel.Dependencies {}

fileprivate struct MockedNavigation {}
