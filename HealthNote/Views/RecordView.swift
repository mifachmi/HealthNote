//
//  RecordView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 29/05/24.
//

import SwiftUI
import Speech

struct RecordView: View {
    @EnvironmentObject var speechController: SpeechRecognitionController
    @State private var isLiveTranslationOn = false
    @State private var selectedLanguage = ""
    @Environment(SpeechRecognitionNewController.self) var newSpeechController
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Picker("Language", selection: $selectedLanguage) {
                        Text("Indonesia").tag("Indonesia")
                        Text("Bahasa Inggris").tag("Inggris")
                    }
                    Toggle("Enable Live Transcription", isOn: $isLiveTranslationOn)
                } footer: {
                    Text("Using this feature, you can see the live text of the process of speech-to-text.")
                }
                
                //                Section {
                //                    Text("\(speechController.outputText)")
                //                        .multilineTextAlignment(.leading)
                //                        .font(.subheadline)
                //                }.listRowBackground(Color.clear)
                //
                //                Section {
                //                    Text("\(speechController.transcript)")
                //                        .multilineTextAlignment(.leading)
                //                        .font(.subheadline)
                //                        .background(.blue)
                //                    Text("\(speechController.transcript.count)")
                //                }.listRowBackground(Color.clear)
                
                Section {
                    Text("\(newSpeechController.transcription)")
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                    Text("\(newSpeechController.transcription.count)")
                    Text("Recording Duration: \(newSpeechController.formatDuration(newSpeechController.timeStamp))") // Display the recording duration
                        .padding()
                }.listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            
            VStack {
                WaveformView(audioLevels: newSpeechController.audioLevels) // Display the waveform
                    .frame(height: 100)
                    .padding()
                Text("Click the button below\nto start recording your\nconversation")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundStyle(.gray)
                speechController.getButton()
            }
            
        }
        .frame(maxHeight: .infinity)
        .navigationTitle("Record")
        .navigationBarTitleDisplayMode(.inline)
        .background(.thickMaterial)
    }
}

#Preview {
    RecordView().environment(SpeechRecognitionNewController())
        .environmentObject(SpeechRecognitionController())
}

//struct RecordView_Preview: PreviewProvider {
//    static var previews: some View {
//        RecordView(newSpeechController: SpeechRecognitionNewController()).environmentObject(SpeechRecognitionController())
//    }
//}
