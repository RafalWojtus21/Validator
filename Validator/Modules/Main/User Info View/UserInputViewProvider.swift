//
//  ComponentCustomizationViewProvider.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import Foundation
import SwiftUI
import Combine


struct UserInputViewProvider: View {    
    
    @Bindable var userInfo: UserInfo
    var placeHolder: String { userInfo.description }
    
    var body: some View {
        generateView(for: userInfo.type)
    }
    
    // MARK: - Public implementation
    
    @ViewBuilder
    func generateView(for type: UserDataType) -> some View {
        switch type {
        case .date:
            DateInputView(date: $userInfo.dateTime, title: userInfo.description)
                .onChange(of: userInfo.dateTime) { oldValue, newValue in
                    print(newValue)
                }
        case .string:
            StringInputView(stringData: $userInfo.stringData, placeHolder: placeHolder)
        case .integer:
            IntegerInputView(integerData: $userInfo.integerData, numberFormatter: NumberFormatter.defaultDecimalFormatter, valueId: userInfo.id, placeHolder: userInfo.description)
        }
    }
    
}

#Preview {
    VStack {
        UserInputViewProvider(userInfo: .init(type: .date, description: "Date"))
        Divider()
        UserInputViewProvider(userInfo: .init(type: .string, description: "Name"))
        Divider()
        UserInputViewProvider(userInfo: .init(type: .integer, description: "Age"))
    }
}
