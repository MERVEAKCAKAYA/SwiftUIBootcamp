//
//  NoteViewModel.swift
//  Odev_8
//
//  Created by Merve Akçakaya on 7.10.2025.
//

import SwiftUI
import CoreData

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    let context = PersistenceController.shared.container.viewContext
    
    init() {
        fetchNotes()
    }
    
    func fetchNotes() {
        let request = NSFetchRequest<Note>(entityName: "Note")
        do {
            notes = try context.fetch(request)
        } catch {
            print("Fetch hatası: \(error)")
        }
    }
    
    func addNote(title: String, content: String) {
        let newNote = Note(context: context)
        newNote.id = UUID()
        newNote.title = title
        newNote.content = content
        newNote.date = Date()
        save()
    }
    
    func updateNote(_ note: Note, newTitle: String, newContent: String) {
        note.title = newTitle
        note.content = newContent
        note.date = Date()
        save()
    }
    
    func deleteNotes(at offsets: IndexSet) {
        offsets.map { notes[$0] }.forEach(context.delete)
        save()
    }
    
    private func save() {
        do {
            try context.save()
            fetchNotes()
        } catch {
            print("Kaydetme hatası: \(error)")
        }
    }
}
