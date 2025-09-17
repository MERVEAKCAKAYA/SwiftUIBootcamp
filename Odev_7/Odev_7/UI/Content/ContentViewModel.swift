//
//  ContentViewModel.swift
//  Odev_7
//
//  Created by Merve Akçakaya on 11.09.2025.
//
import Foundation
class ContentViewModel: ObservableObject {
    @Published var notes: [Note] = [] {
           didSet {
               kaydetNotes()
           }
       }
       
       private let notesKey = "kaydedilenNotlar"
       
       init() {
           yukleNotes()
       }
       
       // Notları kaydetme
       private func kaydetNotes() {
           if let encoded = try? JSONEncoder().encode(notes) {
               UserDefaults.standard.set(encoded, forKey: notesKey)
           }
       }
       
       // Notları yükleme
       private func yukleNotes() {
           if let savedData = UserDefaults.standard.data(forKey: notesKey),
              let decoded = try? JSONDecoder().decode([Note].self, from: savedData) {
               notes = decoded
           }
       }
       
       // Yeni not ekleme
       func ekleNote(title: String, content: String) {
           let newNote = Note(title: title, content: content, date: Date())
           notes.append(newNote)
       }
       
       // Not silme
       func silNote(at offsets: IndexSet) {
           notes.remove(atOffsets: offsets)
       }
}
