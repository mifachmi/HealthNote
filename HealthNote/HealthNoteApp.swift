//
//  HealthNoteApp.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 28/05/24.
//

import SwiftUI

@main
struct HealthNoteApp: App {
    var speechRecognitionController = SpeechRecognitionController()
    @State var newSpeechRecognitionController = SpeechRecognitionNewController()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(speechRecognitionController)
                .environment(newSpeechRecognitionController)
        }
    }
}
