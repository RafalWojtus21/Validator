//
//  DateInputView.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import SwiftUI

struct DateInputView: View {
    
    @Binding var date: Date
    var title: String
    
    var body: some View {
        DatePicker(
            title,
            selection: $date,
            displayedComponents: [.date]
        )
    }
}

#Preview {
    DateInputView(date: .constant(.now), title: "Birth date")
}
