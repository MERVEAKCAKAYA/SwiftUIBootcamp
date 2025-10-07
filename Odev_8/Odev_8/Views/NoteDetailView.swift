//
//  NoteDetailView.swift
//  Odev_8
//
//  Created by Merve Akçakaya on 7.10.2025.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: NoteViewModel
    @State var note: Note
    @State private var newTitle = ""
    @State private var newContent = ""
    
    var body: some View {
        Form {
            Section("Başlık") {
                TextField("Not başlığı", text: $newTitle)
            }
            Section("İçerik") {
                TextEditor(text: $newContent)
                    .frame(height: 150)
            }
        }
        .navigationTitle("Notu Düzenle")
        .onAppear {
            newTitle = note.title ?? ""
            newContent = note.content ?? ""
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Güncelle") {
                    viewModel.updateNote(note, newTitle: newTitle, newContent: newContent)
                    dismiss()
                }
            }
        }
    }
}

