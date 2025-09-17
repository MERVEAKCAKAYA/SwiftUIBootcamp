//
//  AddNoteView.swift
//  Odev_7
//
//  Created by Merve Akçakaya on 17.09.2025.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ContentViewModel
    
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Başlık")) {
                    TextField("Not başlığını girin", text: $title)
                }
                Section(header: Text("İçerik")) {
                    TextField("Not içeriğini yazın", text: $content, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
            }
            .navigationTitle("Yeni Not")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        if !title.isEmpty && !content.isEmpty {
                            viewModel.ekleNote(title: title, content: content)
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("İptal") {
                        dismiss()
                    }
                }
            }
        }
    }
}
