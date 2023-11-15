//
//  IntegerInputView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI
import Combine

struct IntegerInputView: View {
    
    @Binding var integerData: Int
    @Environment(ValidatorImpl.self) private var validator
    @Environment(UserDataStorageImpl.self) private var userDataStorage
    @State var subscribers: [AnyCancellable] = []
    @State var validationMessage = ""
    @State private var text: String = ""
    let valuesId: UUID
    let type: UserDataType
    let numberFormatter: NumberFormatter
    let valueId: UUID
    var placeHolder: String

    var body: some View {
        VStack(spacing: 10) {
            integerTextfield
            ValidationMessageView(validationMessage)
                .frame(height: 20)
        }
    }
    
    private var integerTextfield: some View {
        TextField(placeHolder, text: $text)
            .inputTextfieldStyle()
            .keyboardType(.numberPad)
            .onAppear {
                text = ""
            }
            .onChange(of: text, { _, newValue in
                let digits = newValue.filter { $0.isNumber }
                if let formattedText = format(digits) {
                    assignInteger(from: formattedText)
                    text = formattedText
                }
                validate()
            })
    }
    
    private func format(_ text: String) -> String? {
        if let number = numberFormatter.number(from: text) {
            return numberFormatter.string(from: number)
        } else if let minimum = numberFormatter.minimum, let intValue = Int(text), intValue < minimum.intValue  {
            return numberFormatter.string(from: minimum)
        } else if let maximum = numberFormatter.maximum, let intValue = Int(text), intValue > maximum.intValue  {
            return numberFormatter.string(from: maximum)
        }
        return nil
    }
    
    private func assignInteger(from text: String) {
        guard let intValue = Int(text) else { return }
        integerData = intValue
    }
    
    private func validate() {
        let validationType: Validation.ValidationType? = switch type {
        case .height: .height
        case .weight: .weight
        default: nil
        }
        guard let validationType else { return }
        
        validator.validate(valuesId: valuesId, validationType, input: text)
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
                case .height:
                    userDataStorage.setHeight(integerData)
                case .weight:
                    userDataStorage.setWeight(integerData)
                default:
                    break
                }
            }
            .store(in: &subscribers)
    }


}

#Preview {
    IntegerInputView(integerData: .constant(2), valuesId: .init(), type: .weight, numberFormatter: .init(), valueId: .init(), placeHolder: "")
}
