//
//  Event.swift
//  Odev_6
//
//  Created by Merve Akçakaya on 10.09.2025.
//

import Foundation
enum EventType: String, CaseIterable, Identifiable {
    case dogumGunu = "Doğum Günü"
    case toplantı = "Toplantı"
    case tatil = "Tatil"
    case spor = "Spor"
    case diger = "Diğer"
    
    var id: String { self.rawValue }
}
struct Event: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var date: Date
    var type: EventType
    var hasReminder: Bool
}
