//
//  ValidationMessageView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 15/11/2023.
//

import SwiftUI

struct ValidationMessageView: View {
    let validationMessage: String
    
    init(_ validationMessage: String) {
        self.validationMessage = validationMessage
    }
    
    var body: some View {
        Text(validationMessage)
            .foregroundStyle(validationMessage.isEmpty ? .white : .red)
            .lineLimit(1)
            .minimumScaleFactor(0.7)
    }
}

#Preview {
    ValidationMessageView("Invalid input")
}
