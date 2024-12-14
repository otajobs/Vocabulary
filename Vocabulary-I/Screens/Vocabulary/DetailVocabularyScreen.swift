//
//  DetailVocabularyScreen.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 13/12/24.
//

import SwiftUI

struct DetailVocabularyScreen: View {
    var item: Vocabulary
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.rus)
            Text(item.uz)
            Text(item.eng)
        }
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: EditVocabularyScreen(item: item)) {
                    Label("Edit Item", systemImage: "square.and.pencil")
                }
            }
        }
    }
}

//#Preview {
//    DetailVocabularyScreen()
//}
