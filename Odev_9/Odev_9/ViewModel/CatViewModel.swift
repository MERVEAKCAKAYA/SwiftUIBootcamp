//
//  CatViewModel.swift
//  Odev_9
//
//  Created by Merve Akçakaya on 7.10.2025.
//

import Foundation

@MainActor
class CatViewModel: ObservableObject {
    @Published var cats: [CatImage] = []
    @Published var errorMessage: String?

    func fetchCats() async {
        let urlString = "https://api.thecatapi.com/v1/images/search?limit=10" // 10 resim çeker
        guard let url = URL(string: urlString) else {
            errorMessage = "Geçersiz URL"
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                errorMessage = "Geçersiz yanıt"
                return
            }

            let decoded = try JSONDecoder().decode([CatImage].self, from: data)
            cats = decoded
        } catch {
            errorMessage = "Veri alınamadı: \(error.localizedDescription)"
        }
    }
}
