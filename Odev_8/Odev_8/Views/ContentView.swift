//
//  ContentView.swift
//  Odev_8
//
//  Created by Merve Akçakaya on 28.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NoteViewModel()
    @State private var showAddNote = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes, id: \.id) { note in
                    NavigationLink(destination: NoteDetailView(viewModel: viewModel, note: note)) {
                        VStack(alignment: .leading) {
                            Text(note.title ?? "")
                                .font(.headline)
                            Text(note.date ?? Date(), style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteNotes)
            }
            .navigationTitle("📝 Notlarım")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddNote.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddNote) {
                AddNoteView(viewModel: viewModel)
            }
        }
    }
}
#Preview {
    ContentView()
}

