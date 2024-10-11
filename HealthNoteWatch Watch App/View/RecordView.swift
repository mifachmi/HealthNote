//
//  RecordView.swift
//  HealthNoteWatch Watch App
//
//  Created by Fachmi Dimas Ardhana on 20/06/24.
//

import SwiftUI

struct RecordView: View {
    
    var body: some View {
        Text("Click the button below\nto start recording your\nconversation")
            .multilineTextAlignment(.center)
            .font(.body)
            .foregroundStyle(.gray)
        
        Spacer()
        
        Button {
            
        } label: {
            Image(.record)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    RecordView()
}
