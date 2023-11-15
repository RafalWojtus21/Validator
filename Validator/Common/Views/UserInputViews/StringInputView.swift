//
//  StringInputView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI
import Combine

struct StringInputView: View {
    
    @Binding var stringData: String
    @Environment(ValidatorImpl.self) private var validator
    @Environment(UserDataStorageImpl.self) private var userDataStorage
    @State var subscribers: [AnyCancellable] = []
    @State var validationMessage = ""
    let valuesId: UUID
    let type: UserDataType

    var placeHolder: String
    
    var body: some View {
        VStack(spacing: 10) {
            stringInputTextField
            ValidationMessageView(validationMessage)
                .frame(height: 20)
        }
    }
    
    private var stringInputTextField: some View {
        TextField(placeHolder, text: $stringData)
            .inputTextfieldStyle()
            .autocapitalization(.none)
            .onChange(of: stringData) { oldValue, newValue in
                validate()
            }
    }
    
    private func validate() {
        let validationType: Validation.ValidationType? = switch type {
        case .email: .email
        case .name: .name
        default: nil
        }
        guard let validationType else { return }
        
        validator.validate(valuesId: valuesId, validationType, input: stringData)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.validationMessage = error.localizedDescription
                }
            } receiveValue: { _ in
                self.validationMessage = ""
                switch validationType {
                case .email:
                    userDataStorage.setEmail(stringData)
                case .name:
                    userDataStorage.setName(stringData)
                default:
                    break
                }
            }
            .store(in: &subscribers)
    }
    
}

#Preview {
    StringInputView(stringData: .constant("Test input"), valuesId: .init(), type: .name, placeHolder: "Value")
}
