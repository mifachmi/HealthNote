//
//  ContentView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }.padding()
    }
}

#Preview {
    ContentView()
}
