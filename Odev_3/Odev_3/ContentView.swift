//
//  ContentView.swift
//  Odev_3
//
//  Created by Merve Akçakaya on 8.09.2025.
//

import SwiftUI

struct ContentView: View {
    @State var sayac : Int = 0
    var body: some View {
        HStack {
            Text("Sayaç : ")
                .font(.title)
            Text("\(sayac)")
                .font(.title)
            Button(action: {
                self.sayac += 1
            }) {
                Image("plus").resizable().frame(width: 30, height: 30)
            }
            Button(action: {
                if self.sayac > 0 {
                    self.sayac = self.sayac - 1
                }
            })
            {
                Image("eksi").resizable().frame(width: 30, height: 30)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
