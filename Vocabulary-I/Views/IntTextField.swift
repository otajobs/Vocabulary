//
//  IntTextField.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 14/12/24.
//

import SwiftUI

struct IntTextField: View {
    var placeholder: String
    @Binding var text: Int
    
    var body: some View {
        TextField(placeholder, text: Binding(
            get: { String(text) },  // Convert Int to String
            set: { newValue in          // Convert String to Int
                if let intValue = Int(newValue) {
                    self.text = intValue
                }
            }
        ))
        .keyboardType(.numberPad)
    }
    
    init(_ placeholder: String, text: Binding<Int>) {
        self.placeholder = placeholder
        self._text = text
    }
}

#Preview {
    IntTextField("", text: .constant(0))
}
