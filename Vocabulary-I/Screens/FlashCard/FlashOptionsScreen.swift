//
//  QuizOptionsScreen.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 13/12/24.
//

import SwiftUI

struct FlashOptionsScreen: View {
    @State var option: FlashCardOptions = .init(language: .ruToEng, accuracyMin: 0, accuracyMax: 100, totalMin: 0, totalMax: 4, missMin: 0, missMax: 4, correctMin: 0, correctMax: 4)
    
    var body: some View {
        Form {
            Section("Translation") {
                Picker("Translation", selection: $option.language) {
                    ForEach(FlashCardOptionsLanguage.allCases) { item in
                        Text(item.title)
                            .tag(item)
                    }
                }
            }

            Section("Review count") {
                IntTextField("Min", text: $option.totalMin)
                IntTextField("Max", text: $option.totalMax)
            }
            
            Section("Correct") {
                IntTextField("Min", text: $option.correctMin)
                IntTextField("Max", text: $option.correctMax)
            }

            Section("Miss") {
                IntTextField("Min", text: $option.missMin)
                IntTextField("Max", text: $option.missMax)
            }

            Section {
                NavigationLink(destination: FlashCardScreen(option: option)) {
                    Text("Start")
                        .foregroundStyle(Color.blue)
                }
            }
        }
        .navigationTitle("Options")
    }
}

