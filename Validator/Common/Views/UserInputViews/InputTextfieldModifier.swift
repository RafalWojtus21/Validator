//
//  InputTextfieldModifier.swift
//  Validator
//
//  Created by Rafał Wojtuś on 15/11/2023.
//

import SwiftUI

struct InputTextfieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 0))
    }
    
}

extension View {
    
    func inputTextfieldStyle() -> some View {
        self.modifier(InputTextfieldModifier())
    }
    
}
