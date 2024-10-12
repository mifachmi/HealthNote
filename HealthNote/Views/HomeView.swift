//
//  HomeView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 29/05/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var searchText = ""
    @State var itemTapped: Note?
    
    @Bindable var navController: NavigationController
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Note.createdAt, order: .reverse) var notes: [Note]
    
    var filteredNames: [Note] {
        if searchText.isEmpty {
            notes
        } else {
            notes.filter { $0.title.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack(path: $navController.path) {
            VStack(alignment: .leading) {
                if notes.isEmpty {
                    EmptyNotesView()
                        .frame(maxWidth: .infinity)
                } else {
                    List {
                        Section{
                            ForEach(filteredNames) { data in
                                Button {
                                    navController.goToNextPage(screen: "Result")
                                    self.itemTapped = data
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text(data.title)
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .padding(.horizontal, 4)
                                        Text(data.createdAt)
                                            .font(.caption)
                                            .fontWeight(.light)
                                            .padding(.top, -6)
                                            .padding(.horizontal, 4)
                                    }
                                    .padding(.vertical, 2)
                                }
                                .tint(.titleList)
                            }
                            .onDelete(perform: { indexSet in
                                deleteItem(at: indexSet)
                            })
                        }
                    }
                    .scrollContentBackground(.automatic)
                    .searchable(text: $searchText, placement: .toolbar, prompt: "Search note title")
                }
                
                ZStack {
                    Text("\(notes.count) notes").font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Spacer()
                        Button {
                            navController.goToNextPage(screen: "Record")
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .font(.title2)
                        }
                        .padding(.trailing, 24)
                    }
                    
                }
                .padding(.top)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
            }
            .navigationTitle("Your Medical Notes")
            .navigationDestination(for: String.self, destination: { path in
                if path == "Result" {
                    ResultView(navController: navController, noteFromHome: .constant(itemTapped ?? emptyNote))
                } else {
                    RecordView(navController: navController)
                }
            })
            .background(.recordBackground)
        }
    }
    
    func deleteItem(at offSets: IndexSet) {
        for offSet in offSets {
            let selectedItem = notes[offSet]
            modelContext.delete(selectedItem)
        }
    }
}

#Preview {
    struct HomeView_Preview: View {
        @State var navigationController = NavigationController()
        
        var body: some View {
            HomeView(navController: navigationController)
                .modelContainer(AppModelContainer.container)
                .environment(NavigationController())
        }
    }
    
    return HomeView_Preview()
    
}
