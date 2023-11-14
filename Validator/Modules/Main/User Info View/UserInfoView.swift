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
    @State var validator: ValidatorImpl
    @State private var message = ""
    
    // MARK: - User Interface
    
    var body: some View {
        VStack {
            userInformationView
        }
        .listStyle(.plain)
        .overlay {
            VStack {
                Spacer()
                confirmButton
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
            }
        }
        .navigationTitle("Account")
        .onAppear {
            let ids = viewModel.personalDetails.info.compactMap { $0.id } + viewModel.userSetup.info.compactMap { $0.id }
            validator.setValidationValues(ids)
        }
    }
    
    private var userInformationView: some View {
        Form {
            userSetupSection
            personalDetailsSection
        }
    }
    
    private var userSetupSection: some View {
        Section("User Setup") {
            ForEach(viewModel.userSetup.info) {
                UserInputViewProvider(userInfo: $0)
                    .environment(validator)
            }
        }
    }
    
    private var personalDetailsSection: some View {
        Section("Personal Information") {
            ForEach(viewModel.personalDetails.info) {
                UserInputViewProvider(userInfo: $0)
                    .environment(validator)
            }
        }
    }
    
    private var confirmButton: some View {
        Button {
        } label: {
            HStack {
                Image(systemName: "arrow.right")
                    .font(.title)
                    .foregroundColor(.white)
                Text("Confirm")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(.plain)
        .disabled(!validator.areInputsValid())
    }
    
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(viewModel: .init(dependencies: MockedDependencies(), navigation: MockedNavigation(), userSetup: .init(info: []), personalDetails: .init(info: [])), validator: .init())
    }
}

fileprivate struct MockedDependencies: UserInfoView.ViewModel.Dependencies {}

fileprivate struct MockedNavigation: UserInfoView.ViewModel.Navigation {
    func routeTo(_: UserInfoView.Routes) {}
}
