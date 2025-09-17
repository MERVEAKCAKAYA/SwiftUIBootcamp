//
//  ContentView.swift
//  Odev_7
//
//  Created by Merve Akçakaya on 11.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var showAddSheet = false
    var body: some View {
        NavigationStack {
                List {
                    ForEach(viewModel.notes) { note in
                        NavigationLink {
                            NoteDetailView(note: note)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(note.title)
                                    .font(.headline)
                                Text(note.date.formatted(date: .abbreviated, time: .shortened))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.silNote)
                }
                .navigationTitle("Not Defteri")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showAddSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showAddSheet) {
                    AddNoteView(viewModel: viewModel)
                }
            }
    }
}

#Preview {
    ContentView()
}
