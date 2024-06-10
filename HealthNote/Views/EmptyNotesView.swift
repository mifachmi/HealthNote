//
//  EmptyNotesView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 08/06/24.
//

import SwiftUI

struct EmptyNotesView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("No Note")
                .font(.title2)
                .fontWeight(.bold)
            Text("Your saved notes will appear here. Create your note by clicking button below.")
                .padding(.top)
                .padding(.horizontal, 48)
                .multilineTextAlignment(.center)
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    EmptyNotesView()
}
