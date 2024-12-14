//
//  ContentView.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 13/12/24.
//

import SwiftUI
import SwiftData

struct MainVocabularyScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Review.date, order: .reverse) private var reviews: [Review]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            
            ListOfVocabularyView(sort: SortDescriptor(\Vocabulary.date, order: .reverse), searchString: searchText)
                .searchable(text: $searchText)
                .navigationTitle("Vocabulary")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        NavigationLink(destination: MoreScreen()) {
                            Label("More", systemImage: "ellipsis.circle")
                        }
                    }
                    
                    ToolbarItemGroup(placement: .bottomBar) {
                        NavigationLink(destination: FlashOptionsScreen()) {
                            Label("Add Item", systemImage: "square.on.square")
                        }
                        Spacer()
                        NavigationLink(destination: AddVocabularyScreen()) {
                            Label("Add Item", systemImage: "plus.circle")
                        }
                    }
                }
                .onAppear {
                    if let review = reviews.first {
                        if Calendar.current.isDate(review.date, equalTo: .now, toGranularity: .day) {
                            
                        } else {
                            modelContext.insert(Review())
                        }
                    } else {
                        modelContext.insert(Review())
                    }
                }
        }
    }

}

//#Preview {
//    ListOfVocabularyView()
//        .modelContainer(for: Vocabulary.self, inMemory: true)
//        .modelContainer(for: Review.self, inMemory: true)
//}
