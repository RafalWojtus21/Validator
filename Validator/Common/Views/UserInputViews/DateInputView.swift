//
//  DateInputView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI
import Combine

struct DateInputView: View {
    
    @Binding var date: Date
    @Environment(ValidatorImpl.self) private var validator
    @Environment(UserDataStorageImpl.self) private var userDataStorage
    @State var subscribers: [AnyCancellable] = []
    @State var validationMessage = ""
    @State var ageRestrictionMessage = "You must be at least 8 years old to register. Please select a valid birth date."
    let valuesId: UUID
    var title: String
    
    var body: some View {
        VStack(spacing: 10) {
            ageRestrictionText
                .frame(height: 40)
            datePicker
            ValidationMessageView(validationMessage)
                .frame(height: 20)
        }
    }
    
    private var datePicker: some View {
        DatePicker(
            title + ":",
            selection: $date,
            displayedComponents: [.date]
        )
        .datePickerStyle(.compact)
        .onChange(of: date) { _, newValue in
            validate(newValue)
        }
    }
    
    private var ageRestrictionText: some View {
        Text(ageRestrictionMessage)
            .multilineTextAlignment(.center)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.orange)
    }
    
    private func validate(_ input: Date) {
        validator.validate(valuesId: valuesId, .birthDate, input: input)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.validationMessage = error.localizedDescription
                }
            } receiveValue: { _ in
                self.validationMessage = ""
                ageRestrictionMessage = ""
                userDataStorage.setBirthDate(input)
            }
            .store(in: &subscribers)
    }
}

#Preview {
    DateInputView(date: .constant(.now), valuesId: .init(), title: "Birth date")
}
