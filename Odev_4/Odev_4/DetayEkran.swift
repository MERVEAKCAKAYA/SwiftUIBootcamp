//
//  DetayEkran.swift
//  Odev_4
//
//  Created by Merve Akçakaya on 8.09.2025.
//

import SwiftUI

struct DetayEkran: View {
    var list : Icerik
    init(list: Icerik) {
        self.list = list
    }
    var body: some View {
        Form {
            Section(header: Text("Başlık")) {
                Text(list.baslik)
            }
            Section(header: Text("Açıklama")) {
                Text(list.aciklama)
            }
        }
    }
}

#Preview {
    DetayEkran(   list: Icerik(
        baslik: "Başlık1",
        aciklama: "Bu bir açıklamadır1"
    ))
}
