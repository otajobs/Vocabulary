//
//  ParserScreen.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 14/12/24.
//

import SwiftUI

struct ParserScreen: View {
    @Environment(\.modelContext) private var modelContext
    @State var text = ""
    
    var body: some View {
        Form {
            TextEditor(text: $text)
                .textInputAutocapitalization(.never)
            Button("Parse") {
                parse()
            }
        }
    }
    
    func parse() {
        let vocabularies = text.components(separatedBy: "\n")
        for vocabulary in vocabularies {
            let words = vocabulary.components(separatedBy: "/")
            let ru = words.element(at: 0) ?? "n/a"
            let eng = words.element(at: 1) ?? "n/a"
            let uz = words.element(at: 2) ?? "n/a"
            
            let item = Vocabulary(rus: ru, uz: uz, eng: eng)
            modelContext.insert(item)
        }
        
        text = ""
    }
}

//#Preview {
//    ParserScreen()
//}
