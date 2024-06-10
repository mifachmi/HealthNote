//
//  RawVoice.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 06/06/24.
//

import SwiftUI

struct RawVoice: View {
    
    @Binding var rawVoiceFromHome: String
    
    var body: some View {
        VStack {
            List {
                Section {
                    ZStack {
                        // this is for set height the Section
                        Text(rawVoiceFromHome)
                            .foregroundStyle(.clear)
                            .font(.footnote)
                        LookUpTextViewRepresentable(text: rawVoiceFromHome)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                } footer: {
                    Text("Using this feature, you can access the result of speech-to-text feature.")
                }
            }
        }
        .navigationTitle("Raw Voice")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    struct RawVoice_Preview: View {
        @State var rawVoice = ""
        var body: some View {
            RawVoice(rawVoiceFromHome: $rawVoice)
        }
    }
    
    return RawVoice_Preview()
}
