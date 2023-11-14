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
    @Environment(ValidatorImpl.self) private var validator
    var placeHolder: String { userInfo.description }
    
    var body: some View {
        generateView(for: userInfo.type)
    }
    
    // MARK: - Public implementation
    
    @ViewBuilder
    func generateView(for type: UserDataType) -> some View {
        switch type {
        case .name:
            StringInputView(stringData: $userInfo.stringData, valuesId: userInfo.id, type: .name, placeHolder: placeHolder)
                .environment(validator)
        case .email:
            StringInputView(stringData: $userInfo.stringData, valuesId: userInfo.id, type: .email, placeHolder: placeHolder)
        case .date:
            DateInputView(date: $userInfo.dateTime, valuesId: userInfo.id, title: userInfo.description)
                .environment(validator)
        case .height:
            IntegerInputView(integerData: $userInfo.integerData, valuesId: userInfo.id, type: .height, numberFormatter: NumberFormatter.defaultDecimalFormatter, valueId: userInfo.id, placeHolder: userInfo.description)
                .environment(validator)
        case .weight:
            IntegerInputView(integerData: $userInfo.integerData, valuesId: userInfo.id, type: .weight, numberFormatter: NumberFormatter.defaultDecimalFormatter, valueId: userInfo.id, placeHolder: userInfo.description)
                .environment(validator)
        }
    }
    
}

#Preview {
    VStack {
        UserInputViewProvider(userInfo: .init(type: .date, description: "Date"))
        Divider()
        UserInputViewProvider(userInfo: .init(type: .name, description: "Name"))
        Divider()
        UserInputViewProvider(userInfo: .init(type: .height, description: "Height"))
    }
}
