//
//  ContentView.swift
//  Odev_4
//
//  Created by Merve Akçakaya on 8.09.2025.
//

import SwiftUI

struct Icerik : Identifiable, Hashable {
    var id : UUID = UUID()
    var baslik : String
    var aciklama : String
}

struct ContentView: View {
    var myList : [Icerik] = [
        Icerik(baslik: "Başlık1", aciklama: "Bu bir açıklamadır1"),
        Icerik(baslik: "Başlık2", aciklama: "Bu bir açıklamadır2"),
        Icerik(baslik: "Başlık3", aciklama: "Bu bir açıklamadır3"),
        Icerik(baslik: "Başlık4", aciklama: "Bu bir açıklamadır4"),
        Icerik(baslik: "Başlık5", aciklama: "Bu bir açıklamadır5"),
        Icerik(baslik: "Başlık6", aciklama: "Bu bir açıklamadır6"),
        Icerik(baslik: "Başlık7", aciklama: "Bu bir açıklamadır7"),
        Icerik(baslik: "Başlık8", aciklama: "Bu bir açıklamadır8"),
        Icerik(baslik: "Başlık9", aciklama: "Bu bir açıklamadır9"),
        Icerik(baslik: "Başlık10",aciklama: "Bu bir açıklamadır10")
    ]
    @State var selectedItem : Icerik?
    var body: some View {
        VStack {
            NavigationStack() {
                List(myList) { item in
                    Button{
                        selectedItem = item
                    } label: {
                        MyListItem(list: item)
                    }
                }.navigationTitle("MasterList APP")
                .navigationDestination(item: $selectedItem){ item in
                    DetayEkran(list: item)
            
            }
                
            }
                
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
