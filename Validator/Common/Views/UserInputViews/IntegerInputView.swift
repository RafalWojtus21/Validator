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
    let numberFormatter: NumberFormatter
    let valueId: UUID
    var placeHolder: String
    @State private var text: String = ""

    var body: some View {
        TextField(placeHolder, text: $text)
            .onAppear {
                text = ""
            }
            .onChange(of: text, { _, newValue in
                let digits = newValue.filter { $0.isNumber }
                if let formattedText = format(digits) {
                    assignInteger(from: formattedText)
                    text = formattedText
                }
            })
            .keyboardType(.numberPad)
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

}

#Preview {
    IntegerInputView(integerData: .constant(2), numberFormatter: .init(), valueId: .init(), placeHolder: "")
}
