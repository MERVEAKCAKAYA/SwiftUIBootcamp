//
//  ContentViewModel.swift
//  Odev_5
//
//  Created by Merve Akçakaya on 9.09.2025.
//
import Foundation
class ContentViewModel: ObservableObject {
    
    @Published var gorevler: [Gorev] = []
    @Published var newGorevText: String = ""
    @Published var isAlertShowing : Bool = false
    func addGorev(_ text: String) {
        guard !newGorevText.isEmpty else {
            return
        }
        gorevler.append(Gorev(id: UUID(), title: newGorevText, isCompleted: false))
        newGorevText = ""
    }

    func deleteGorev(with gorev: Gorev) {
        if let index = gorevler.firstIndex(where:{ $0.id == gorev.id }) {
            gorevler.remove(at: index)
        }
    }
}
