//
//  AppModelContainer.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 08/06/24.
//

import Foundation
import SwiftData

// this annotation for concurrency
@MainActor
class AppModelContainer {
    static let container: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Note.self, configurations: config)
            createDummyData(container: container)
            return container
        } catch {
            fatalError("Container not initialized")
        }
    }()
    
    static func createDummyData(container: ModelContainer) {
        for i in 1...3 {
            let note = Note(id: i, title: "Title \(i)", createdAt: getCurrentDate(), summary: "The doctor \(i)", rawVoice: "I see \(i).")
            container.mainContext.insert(note)
        }
        
        try? container.mainContext.save()
    }
}
