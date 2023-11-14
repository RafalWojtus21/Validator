//
//  UserInfoView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI

struct UserInfoView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: ViewModel
    
    // MARK: - User Interface
    
    var body: some View {
        Text("Hello World")
    }
    
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(viewModel: .init(dependencies: MockedDependencies(), navigation: MockedNavigation()))
    }
}

fileprivate struct MockedDependencies: UserInfoView.ViewModel.Dependencies {}

fileprivate struct MockedNavigation: UserInfoView.ViewModel.Navigation {
    func routeTo(_: UserInfoView.Routes) {}
}
