//
//  AddNoteView.swift
//  Odev_8
//
//  Created by Merve Akçakaya on 7.10.2025.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: NoteViewModel
    
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Başlık") {
                    TextField("Not başlığı gir", text: $title)
                }
                Section("İçerik") {
                    TextEditor(text: $content)
                        .frame(height: 150)
                }
            }
            .navigationTitle("Yeni Not")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        viewModel.addNote(title: title, content: content)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("İptal") { dismiss() }
                }
            }
        }
    }
}
