//
//  NoteDetailView.swift
//  Odev_7
//
//  Created by Merve Akçakaya on 17.09.2025.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(note.title)
                .font(.largeTitle)
                .bold()
            
            Text(note.date.formatted(date: .long, time: .shortened))
                .font(.caption)
                .foregroundColor(.gray)
            
            Divider()
            
            Text(note.content)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Not Detayı")
    }
}
