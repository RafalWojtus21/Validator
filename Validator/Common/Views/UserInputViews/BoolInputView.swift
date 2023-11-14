//
//  BoolInputView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI

struct BoolInputView: View {
    
    @Binding var boolData: Bool

    var body: some View {
        Toggle("", isOn: $boolData)
    }
}

#Preview {
    BoolInputView(boolData: .constant(false))
}
