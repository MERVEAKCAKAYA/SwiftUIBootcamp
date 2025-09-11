//
//  ContentViewModel.swift
//  Odev_6
//
//  Created by Merve Akçakaya on 10.09.2025.
//
import Foundation
class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    func addEvent(title: String, date: Date, type: EventType, hasReminder: Bool) {
        let newEvent = Event(title: title, date: date, type: type, hasReminder: hasReminder)
        events.append(newEvent)
    }
    
    func deleteEvent(event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    func toggleReminder(for event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index].hasReminder.toggle()
        }
    }
}
