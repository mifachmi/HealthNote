//
//  NotesModel.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 29/05/24.
//

import Foundation
import SwiftData

@Model
class Note: Identifiable {
    var id: Int
    var title: String
    var createdAt: String
    var summary: String
    var rawVoice: String
    
    init(id: Int, title: String, createdAt: String, summary: String, rawVoice: String) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.summary = summary
        self.rawVoice = rawVoice
    }
}

let emptyNote = Note(id: 0, title: "", createdAt: "", summary: "", rawVoice: "")

struct NoteByDate {
    var headerSection: String
    var notesStruct: [Note]
}

struct NoteStruct {
    var id: Int
    var title: String
    var createdAt: String
    var summary: String
    var rawVoice: String
}

func toNoteByDate(data: [Note]) -> [NoteByDate] {
    return data.map { dataNote in
        NoteByDate(headerSection: compareDates(date1String: dataNote.createdAt), notesStruct: data)
    }
}
