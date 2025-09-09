//
//  Tasarim.swift
//  Odev_5
//
//  Created by Merve Akçakaya on 9.09.2025.
//

import SwiftUI
//reusable cell view for displaying a wish item
struct Tasarim: View {
    var title: String = ""
    //MARK: -body
    var body: some View {
        Text(title)
        //use light callout font style
            .font(.callout.weight(.bold))
        //padding left
            .padding(.leading, 2.0)
    }
}

#Preview {
    Tasarim()
}
