//
//  ContentView.swift
//  BeBetter
//
//  Created by Karlo Nevešćanin on 21.01.2024..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.BG)
            .preferredColorScheme(.light)
        
    }
}

#Preview {
    ContentView()
}
