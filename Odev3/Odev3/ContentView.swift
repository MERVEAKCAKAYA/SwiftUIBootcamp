//
//  ContentView.swift
//  Odev3
//
//  Created by Merve Akçakaya on 24.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // Header
                ZStack {
                    LinearGradient(colors: [.purple, .blue],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                        .frame(height: 200)
                        .ignoresSafeArea(edges: .top)
                    
                    VStack {
                        Image("merve")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 7)
                        
                        Text("Merve Akçakaya Okur")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Software Developer | Swift C#")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                
                // Bilgi Kartları
                HStack(spacing: 12) {
                    InfoCard(title: "Takipçi", value: "1.2K")
                    InfoCard(title: "Takip", value: "350")
                    InfoCard(title: "Beğeni", value: "4.5K")
                }
                .padding(.horizontal)
                
                // Hakkımda
                VStack(alignment: .leading, spacing: 8) {
                    Text("Hakkımda")
                        .font(.headline)
                        .bold()
                    
                    Text("""
                    Merhaba! Ben Merve. Bilgisayar mühendisiyim. Özel bir şirkette 3,5 yıldır masaüstü uygulaması geliştirmekteyim. Kendimi geliştirmek ve yeni iş imkanlarına olanak sağlamak için Swift öğrenmeye çalışıyorum.
                    """)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }
                .padding(.horizontal)
                
                // Butonlar
                HStack(spacing: 16) {
                    Button("Mesaj Gönder") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                    Button("Takip Et") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
            }
        }
    }
}
struct InfoCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.headline)
                .bold()
                .foregroundColor(.primary)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
