//
//  ContentView.swift
//  Odev_6
//
//  Created by Merve Akçakaya on 10.09.2025.
//


import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = EventViewModel()
    @State private var showAddSheet = false
    

    @State private var selectedEvent: Event?
    
    var body: some View {
        NavigationStack {
            List(viewModel.events) { event in
                Button {
                    selectedEvent = event
                } label: {
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.headline)
                        Text(event.date, style: .date)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(event.type.rawValue)
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Etkinlikler")
            .toolbar {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
         
            .navigationDestination(item: $selectedEvent) { event in
                EventDetailView(viewModel: viewModel, event: event)
            }
            .sheet(isPresented: $showAddSheet) {
                AddEventView(viewModel: viewModel, showSheet: $showAddSheet)
            }
        }
    }
}


#Preview {
    ContentView()
}

