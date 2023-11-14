//
//  StringInputView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI

struct StringInputView: View {
    
    @Binding var stringData: String
    var placeHolder: String
    
    var body: some View {
        TextField(placeHolder, text: $stringData)
    }
    
}

#Preview {
    StringInputView(stringData: .constant("Test input"), placeHolder: "Value")
}
