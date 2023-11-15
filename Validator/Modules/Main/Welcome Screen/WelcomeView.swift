//
//  WelcomeView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 15/11/2023.
//

import SwiftUI

struct WelcomeView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: ViewModel
    
    // MARK: - User Interface
    
    var body: some View {
        Text(viewModel.name)
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(viewModel: .init(dependencies: MockedDependencies(), navigation: MockedNavigation(), name: "Jack"))
    }
}

fileprivate struct MockedDependencies: WelcomeView.ViewModel.Dependencies {}

fileprivate struct MockedNavigation: WelcomeView.ViewModel.Navigation {
    func routeTo(_: WelcomeView.Routes) {}
}
