//
//  NutrientView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct NutrientView: View {
    let text: String
    let num: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.subheadline)
                .foregroundStyle(Color(.black))
            
            Spacer()
            
            Text(num)
                .font(.subheadline)
                .foregroundStyle(Color(.gray))
        }
        
    }
}

struct NutrientView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientView(text: "raaaaa", num: "100kg")
    }
}
