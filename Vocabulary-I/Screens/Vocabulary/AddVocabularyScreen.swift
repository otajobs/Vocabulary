//
//  AddVocabularyScreen.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 13/12/24.
//

import SwiftUI

struct AddVocabularyScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: Field?
    @State private var rus: String = ""
    @State private var uz: String = ""
    @State private var eng: String = ""
    
    enum Field {
        case ru, eng, uz
    }
    
    var body: some View {
        Form {
            TextField("rus", text: $rus)
                .focused($focusedField, equals: .ru)
                .onSubmit {
                    focusedField = .eng
                }
            TextField("eng", text: $eng)
                .focused($focusedField, equals: .eng)
                .onSubmit {
                    focusedField = .uz
                }
            TextField("uz", text: $uz)
                .focused($focusedField, equals: .uz)
                .onSubmit {
                    save()
                }
            
            Section {
                Button("Save") {
                    save()
                }
            }
        }
        .navigationTitle("Add New Word")
        .navigationBarTitleDisplayMode(.inline)
        .textInputAutocapitalization(.never)
        .onAppear {
            focusedField = .ru
        }
    }
    
    func save() {
        let item = Vocabulary(rus: rus, uz: uz, eng: eng)
        modelContext.insert(item)
        rus = ""
        eng = ""
        uz = ""
        focusedField = .ru
    }
}

//#Preview {
//    AddVocabularyScreen()
//}
