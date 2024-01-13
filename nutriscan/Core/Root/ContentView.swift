//
//  ContentView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("pink")
                .ignoresSafeArea()
            Text("Hello World!!")
                .font(.system(size: 50))
        }
    }
}

#Preview {
    ContentView()
}
