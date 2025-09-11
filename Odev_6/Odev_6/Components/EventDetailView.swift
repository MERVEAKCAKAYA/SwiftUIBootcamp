//
//  EventDetailView.swift
//  Odev_6
//
//  Created by Merve Akçakaya on 11.09.2025.
//

import SwiftUI

struct EventDetailView: View {
    @ObservedObject var viewModel: EventViewModel
    let event: Event
    @Environment(\.dismiss) private var dismiss   // ✅ geri dönmek için
    var body: some View {
        VStack(spacing: 20) {
            Text(event.title)
                .font(.largeTitle)
                .bold()
            
            Text("Tarih: \(event.date.formatted(date: .long, time: .omitted))")
            Text("Tür: \(event.type.rawValue)")
            
            Toggle("Hatırlatıcı", isOn: Binding(
                get: { event.hasReminder },
                set: { _ in viewModel.toggleReminder(for: event) }
            ))
            .padding()
            
            Button(role: .destructive) {
                viewModel.deleteEvent(event: event)
                dismiss()
            } label: {
                Text("Sil")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detay")
    }
}
