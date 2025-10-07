//
//  ContentView.swift
//  Odev_9
//
//  Created by Merve Akçakaya on 7.10.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CatViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let error = viewModel.errorMessage {
                    Text("Bir hata oluştu: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else if viewModel.cats.isEmpty {
                    ProgressView("Kediler yükleniyor...")
                        .task {
                            await viewModel.fetchCats()
                        }
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(viewModel.cats) { cat in
                            AsyncImage(url: URL(string: cat.url)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 3)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("🐱 Kediler Galerisi")
            .toolbar {
                Button("Yenile") {
                    Task {
                        await viewModel.fetchCats()
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
