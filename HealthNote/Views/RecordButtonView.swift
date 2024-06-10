//
//  RecordButtonView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 30/05/24.
//

import SwiftUI
import Speech

struct RecordButtonView: View {
    
    @State private var isSpeechRecognizerAvailable = false
    @State private var statusMessage = "Checking availability..."
    @State var isRecordingFinished = false
    @State private var showAlert = false

    @Environment(SpeechRecognitionController.self) var speechController
    @Bindable var navController: NavigationController
    @Binding var selectedLanguage: SpeechLanguage
        
    var body: some View {
        if !speechController.isRecording {
            Text("Click the button below\nto start recording your\nconversation")
                .multilineTextAlignment(.center)
                .font(.body)
                .foregroundStyle(.gray)
        }
        Button {
            requestSpeechRecognitionAuthorization { authorized in
                if authorized {
                    self.speechController.isRecording.toggle()
                    speechController.speechLanguage = selectedLanguage.rawValue
                    if (self.speechController.isRecording) {
                        self.speechController.startRecordingAndTranscribing()
                        isRecordingFinished = false
                    } else {
                        self.speechController.stopRecordingAndTranscribing()
                        isRecordingFinished = true
                    }
                    
                } else {
                    self.showAlert = true
                }
            }
        } label: {
            Image(self.speechController.isRecording ? "stop" : "record")
        }
        .padding(.top)
        .onAppear {
            checkSpeechRecognizerAvailability()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Speech Recognition Permission"),
                message: Text("Please enable speech recognition permissions in Settings."),
                primaryButton: .default(Text("Settings"), action: {
                    showSettingsAlert()
                }),
                secondaryButton: .cancel()
            )
        }
        .navigationDestination(isPresented: $isRecordingFinished) {
            ResultView(navController: navController, noteFromHome: .constant(emptyNote))
        }
    }
    
    private func checkSpeechRecognizerAvailability() {
        if let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "id-ID")) {
            isSpeechRecognizerAvailable = recognizer.isAvailable
            statusMessage = isSpeechRecognizerAvailable ? "Speech Recognizer is available" : "Speech Recognizer is not available"
        } else {
            statusMessage = "Speech Recognizer could not be initialized"
        }
    }
}

#Preview {
    struct RecordButtonView_Preview: View {
        @State var navigationController = NavigationController()
        @State var speechLang: SpeechLanguage = .indonesia
        
        var body: some View {
            RecordButtonView(navController: navigationController, selectedLanguage: $speechLang)
                .environment(SpeechRecognitionController(lang: speechLang.rawValue))
                .modelContainer(AppModelContainer.container)
        }
    }
    
    return RecordButtonView_Preview()
    
}
