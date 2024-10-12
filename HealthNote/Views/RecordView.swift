//
//  RecordView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 29/05/24.
//

import SwiftUI
import Speech

struct RecordView: View {
    
    @State private var isLiveTranslationOn = true
    @State private var selectedLanguage: SpeechLanguage = .indonesia
    @Environment(SpeechRecognitionController.self) var speechController
    @Bindable var navController: NavigationController
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Picker("Language", selection: $selectedLanguage) {
                        Text("Indonesian").tag(SpeechLanguage.indonesia)
                        Text("English (US)").tag(SpeechLanguage.english)
                    }
                    Toggle("Enable Live Transcription", isOn: $isLiveTranslationOn)
                } footer: {
                    Text("Enabling this feature, you can see the live text of the process of speech-to-text below.")
                }
                
                if isLiveTranslationOn {
                    Section {
                        Text("\(speechController.transcription)")
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                    } footer: {
                        Button {
                            speechController.resetTranscription()
                        } label: {
                            Text("reset transcription").textCase(.uppercase)
                                .font(.footnote)
                                .foregroundStyle(.red)
                        }
                    }
                }
                
            }
            .scrollContentBackground(.hidden)
            .background(.recordBackground)
            
            Text("\(speechController.formatDuration(speechController.timeStamp))")
                .padding()
            
            RecordButtonView(navController: navController, selectedLanguage: $selectedLanguage)
            
        }
        .frame(maxHeight: .infinity)
        .navigationTitle("Record")
        .navigationBarTitleDisplayMode(.inline)
        .background(.recordBackground)
        //        .onAppear {
        //            speechController.resetTranscription()
        //        }
    }
}

#Preview {
    struct RecordView_Preview: View {
        @State var navigationController = NavigationController()
        @State var lang: SpeechLanguage = .indonesia
        
        var body: some View {
            RecordView(navController: navigationController)
                .environment(SpeechRecognitionController(lang: lang.rawValue))
                .modelContainer(AppModelContainer.container)
        }
    }
    
    return RecordView_Preview()
    
}
