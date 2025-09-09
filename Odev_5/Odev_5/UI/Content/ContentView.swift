//
//  ContentView.swift
//  Odev_5
//
//  Created by Merve Akçakaya on 9.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel = ContentViewModel()
    var body: some View {
        NavigationStack{
            
        
            List(viewModel.gorevler){ gorev in
                Tasarim(title: gorev.title)
                //listede sola kaydirinca ogeyi silme islemi
                    .swipeActions(edge: .trailing) {
                       deleteButton(gorev)
                    }
            }//: list
            .navigationBarTitle("Görev Yönetim App")
            .toolbar {
                ToolbarItem {
                   addButton()
                }
                ToolbarItem(placement: .bottomBar){
                   
                }
            } //: toolbar
        }//: navigationstack
        .alert("Yeni Görev Ekle", isPresented:$viewModel.isAlertShowing)
        {
           alertView()
        }
        .overlay(alignment: .center) {
           noContentView()
        } //: overlay burada ekranda data yokken gorunmesini istedigimiz seyleri koyuyoruz.
    }//: body
}

#Preview {
    ContentView()
}

extension ContentView {
    @ViewBuilder
    func deleteButton(_ gorev: Gorev) -> some View {
        Button("Delete", role: .destructive) {
            viewModel.deleteGorev(with: gorev)
        }//: delete button
    }
    
    @ViewBuilder
    func addButton() -> some View {
        Button {
            viewModel.isAlertShowing.toggle()
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    @ViewBuilder
    func alertView() -> some View {
        TextField("Görev Yaz", text: $viewModel.newGorevText)
        Button("Add") {
            viewModel.addGorev(viewModel.newGorevText)
        }
    }
    @ViewBuilder
    func noContentView() -> some View {
        if viewModel.gorevler.isEmpty {
            ContentUnavailableView("Görevlerim", systemImage: "star.circle",description: Text("Henüz görev eklenmedi."))
        }
    }
}
