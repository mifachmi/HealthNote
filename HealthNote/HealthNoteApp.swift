//
//  HealthNoteApp.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 28/05/24.
//

import SwiftUI
import SwiftData

@main
struct HealthNoteApp: App {
    @State var speechRecognitionController = SpeechRecognitionController(lang: "")
    @State var openAIViewModel = OpenAIViewModel()
    @State var navigationController = NavigationController()
    
    var body: some Scene {
        WindowGroup {
            HomeView(navController: navigationController)
                .environment(openAIViewModel)
                .environment(speechRecognitionController)
        }
        .modelContainer(for: Note.self)
    }
}
