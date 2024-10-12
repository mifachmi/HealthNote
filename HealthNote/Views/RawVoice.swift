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
                        if #available(iOS 18.0, *) {
                            Text(rawVoiceFromHome)
                                .font(.footnote)
                                .textSelectionAffinity(.automatic)
                                .textSelection(.enabled)
                        } else {
                            // Fallback on earlier versions
                            Text(rawVoiceFromHome)
                                .font(.footnote)
                                .textSelection(.enabled)
                        }
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
