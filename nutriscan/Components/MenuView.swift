//
//  MenuView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct MenuView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundStyle(Color(.black))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(text: "raaaaa")
    }
}
