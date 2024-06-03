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
    @State var isSpeechRecognizeAuthorized = false
    @State private var showAlert = false
    @EnvironmentObject var speechController: SpeechRecognitionController
    @Environment(SpeechRecognitionNewController.self) var newSpeechController
    
    var body: some View {
        Button {
            print("hehehe 2")
            requestSpeechRecognitionAuthorization { authorized in
                if authorized {
                    print(authorized)
                    self.newSpeechController.isRecording.toggle()
                    self.newSpeechController.isRecording ? self.newSpeechController.startRecordingAndTranscribing() : self.newSpeechController.stopRecordingAndTranscribing()
                    
                    //                    self.isSpeechRecognizeAuthorized.toggle()
                    //                    if self.isSpeechRecognizeAuthorized {
                    //                        print(authorized)
                    //
                    //                        self.newSpeechController.isRecording.toggle()
                    //                        self.newSpeechController.isRecording ? self.newSpeechController.startRecordingAndTranscribing() : self.newSpeechController.stopRecordingAndTranscribing()
                    //                    } else {
                    //                        print(authorized)
                    //                    }
                    
                } else {
                    self.showAlert = true
                }
            }
        } label: {
            Image("record")
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
    RecordButtonView()
        .environment(SpeechRecognitionNewController())
}
