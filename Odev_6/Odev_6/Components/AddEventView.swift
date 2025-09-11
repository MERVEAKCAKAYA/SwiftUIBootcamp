//
//  AddEventView.swift
//  Odev_6
//
//  Created by Merve Akçakaya on 11.09.2025.
//

import SwiftUI

struct AddEventView: View {
    @ObservedObject var viewModel: EventViewModel
    @Binding var showSheet: Bool
    
    @State private var title = ""
    @State private var date = Date()
    @State private var type: EventType = .diger
    @State private var hasReminder = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Etkinlik Bilgileri")) {
                    TextField("Etkinlik adı", text: $title)
                    DatePicker("Tarih", selection: $date, displayedComponents: .date)
                    Picker("Tür", selection: $type) {
                        ForEach(EventType.allCases) { eventType in
                            Text(eventType.rawValue).tag(eventType)
                        }
                    }
                    Toggle("Hatırlatıcı", isOn: $hasReminder)
                }
            }
            .navigationTitle("Yeni Etkinlik")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("İptal") { showSheet = false }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        viewModel.addEvent(title: title, date: date, type: type, hasReminder: hasReminder)
                        showSheet = false
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

