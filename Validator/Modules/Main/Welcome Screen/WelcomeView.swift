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
        ZStack {
            Color.mint
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("All data set, \(viewModel.userData?.name ?? ""). Let's begin!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                
                Spacer()
            }
        }
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let userDataStorage = UserDataStorageImpl()
        WelcomeView(viewModel: .init(dependencies: MockedDependencies(), navigation: MockedNavigation(), userDataStorage: userDataStorage))
    }
}

fileprivate struct MockedDependencies: WelcomeView.ViewModel.Dependencies {
}

fileprivate struct MockedNavigation: WelcomeView.ViewModel.Navigation {
    func routeTo(_: WelcomeView.Routes) {}
}
