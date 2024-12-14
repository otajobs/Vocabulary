//
//  Vocabulary_IApp.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 13/12/24.
//

import SwiftUI
import SwiftData

@main
struct Vocabulary_IApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Vocabulary.self,
            Review.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainVocabularyScreen()
        }
        .modelContainer(sharedModelContainer)
    }
}
