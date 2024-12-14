//
//  EditVocabularyScreen.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 13/12/24.
//

import SwiftUI

struct EditVocabularyScreen: View {
    @Bindable var item: Vocabulary
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        Form {
            TextField("rus", text: $item.rus)
                .focused($isTextFieldFocused)
            TextField("eng", text: $item.eng)
            TextField("uz", text: $item.uz)
            
            
            Section {
                Button("Save") {
                    dismiss()
                }
            }
        }
        .navigationTitle("Edit New Word")
        .navigationBarTitleDisplayMode(.inline)
        .textInputAutocapitalization(.never)
        .onAppear {
            isTextFieldFocused = true
        }
    }
}


//#Preview {
//    EditVocabularyScreen()
//}
