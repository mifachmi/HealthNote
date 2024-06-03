//
//  HomeView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 29/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var path:[String] = []
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    List{
                        Section{
                            ForEach(notesDummyData) { data in
                                VStack(alignment: .leading) {
                                    Text(data.title)
                                    Text(data.createdAt)
                                        .font(.caption)
                                        .fontWeight(.light)
                                        .foregroundStyle(.gray)
                                        .padding(.top, -6)
                                }
                                
                            }
                        } header: {
                            HStack(spacing:0){
                                Text("Today").font(.title3).foregroundStyle(.black).fontWeight(.semibold).textCase(nil)
                                
                            }.offset(x: -16).padding(.bottom, 4)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                
                Spacer()
                
                ZStack {
                    Text("2 notes").font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Spacer()
                        Button {
                            print("hehehe 1")
                            path.append("Record")
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .font(.title2)
                        }
                        .padding(.trailing, 24)
                    }
                    
                }
                .padding(.top)
                .padding(.bottom, 2)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
            }
            .navigationTitle("Health's Notes")
            .navigationDestination(for: String.self, destination: { path in
                RecordView()
            })
            .searchable(text: $searchText, placement: .toolbar, prompt: "Search note title")
            .background(.regularMaterial)
        }
    }
}

#Preview {
    HomeView()
}
