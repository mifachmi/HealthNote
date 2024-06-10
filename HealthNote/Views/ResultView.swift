//
//  ResultView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 06/06/24.
//

import SwiftUI
import SwiftData

struct ResultView: View {
    @State private var showingAlert = false
    @State private var inputNoteTitle = ""
    @State private var defaultSummaryData = "Can't find the summary"
    @State private var defaultTitlePage = "Result"
    @State private var selectedModelGPT = "gpt-3.5-turbo-1106"
    
    @Environment(OpenAIViewModel.self) var openAIViewModel
    @Environment(SpeechRecognitionController.self) var speechController
    
    @Bindable var navController: NavigationController
    @Binding var noteFromHome: Note
    
    @Environment(\.modelContext) var modelContext
    @Query var notes: [Note]
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                Section {
                    if noteFromHome.summary != "" {
                        ZStack {
                            // this is for set height the Section
                            Text(noteFromHome.summary)
                                .foregroundStyle(.clear)
                                .font(.footnote)
                                .fontWeight(.regular)
                            
                            LookUpTextViewRepresentable(text: noteFromHome.summary)
                                .font(.footnote)
                                .fontWeight(.regular)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                    } else {
                        switch openAIViewModel.state {
                        case .idle, .loading:
                            ProgressView()
                        case .loaded(let mappedData):
                            ZStack {
                                // this is for set height the Section
                                Text(mappedData.content)
                                    .foregroundStyle(.clear)
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                
                                LookUpTextViewRepresentable(text: mappedData.content)
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                        case .failed(let errorResponse):
                            Text(errorResponse.localizedDescription)
                        }
                    }
                    
                    
                } header: {
                    Text("Summary").font(.title3).foregroundStyle(.titleList).fontWeight(.semibold).textCase(nil)
                        .offset(x: -16).padding(.bottom, 4)
                } footer: {
                    Text("By utilizing Extractive Summarization feature with TextRank algorithm, we provide you the summary of the recorded conversation.")
                }
                
                Section {
                    NavigationLink("Raw Voice", destination: RawVoice(rawVoiceFromHome: noteFromHome.rawVoice != "" ? .constant(noteFromHome.rawVoice) : .constant(speechController.transcription)))
                } footer: {
                    Text("Using this feature, you can access the result of speech-to-text feature.")
                }
            }
            
        }
        .frame(alignment: .top)
        .background(.regularMaterial)
        .navigationTitle(noteFromHome.title == "" ? defaultTitlePage : noteFromHome.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            if noteFromHome.summary == "" {
                openAIViewModel.askToSummarize2(prompt: setPrompt(language: speechController.speechLanguage, rawVoice: speechController.transcription), modelGPT: selectedModelGPT)
            }
        })
        .toolbar {
            if noteFromHome.title == "" {
                Button {
                    showingAlert.toggle()
                } label: {
                    Text("Save")
                }
                .alert("Save note", isPresented: $showingAlert) {
                    TextField("Enter the title", text: $inputNoteTitle)
                        .font(.footnote)
                        .textInputAutocapitalization(.words)
                    
                    Button("Cancel", role: .cancel) {}
                    Button("Save") {
                        let savedNote = Note(id: createIdNote(), title: inputNoteTitle, createdAt: getCurrentDate(), summary: openAIViewModel.dataMappedOpenAiModel?.content ?? "", rawVoice: speechController.transcription)
                        modelContext.insert(savedNote)
                        openAIViewModel.responseApi = ""
                        speechController.resetTranscription()
                        navController.goToFirstScreen()
                    }
                } message: {
                    Text("Your data will be saved.")
                }
            }
        }
    }
    
    func createIdNote() -> Int {
        let getCurrentCount = notes.count
        return getCurrentCount + 1
    }
    
    func setPrompt(language: String, rawVoice: String) -> String {
        switch language {
        case SpeechLanguage.english.rawValue:
            return "Create summary from this text\n\n\(rawVoice)"
        case SpeechLanguage.indonesia.rawValue:
            return "Buat ringkasan dari teks berikut\n\n\(rawVoice)"
        default:
            return "Create summary from this text\n\n\(rawVoice)"
        }
    }
}

#Preview {
    struct ResultView_Preview: View {
        @State var navigationController = NavigationController()
        @State var selectedNote = emptyNote
        @State var lang: SpeechLanguage = .indonesia
        @Query var notes: [Note]
        
        var body: some View {
            ResultView(navController: navigationController, noteFromHome: .constant(notes.first!))
                .environment(SpeechRecognitionController(lang: lang.rawValue))
                .environment(OpenAIViewModel())
                .modelContainer(AppModelContainer.container)
        }
    }
    
    return ResultView_Preview()
}
