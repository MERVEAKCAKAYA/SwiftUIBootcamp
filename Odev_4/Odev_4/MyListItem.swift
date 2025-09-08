//
//  MyListItem.swift
//  Odev_4
//
//  Created by Merve Akçakaya on 8.09.2025.
//

import SwiftUI

struct MyListItem: View {
    var list : Icerik
    init(list: Icerik) {
        self.list = list
    }
    var body: some View {
        HStack{
            Text(list.baslik).font(.headline).foregroundStyle(.black)
            Spacer()
            Text(list.aciklama).foregroundStyle(.green)
        }
    }
}

#Preview {
    MyListItem(
        list: Icerik(
            baslik: "Başlık1",
            aciklama: "Bu bir açıklamadır1"
        ))
}
