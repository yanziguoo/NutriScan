//
//  NutritionView.swift
//  nutriscan
//
//  Created by Simra Khan on 2024-01-13.
//

import Foundation
import SwiftUI

struct NutritionView: View {
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Section {
                        VStack {
                                Text("Nutrients in Your Meal")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.black))
                        }
                    }
                    
                    NutrientsData(a: "395", b: "21.1 g", c: "11.7 g", d: "8.2 g", e: "436 mg", f: "105 mg", g: "66 mg", h: "45 g", i: "2.6 g", j: "11.2 g")
                }
                
                NavigationLink (destination: WarningsView()) {
                    Text("Next")
                        .frame(width: UIScreen.main.bounds.width - 120, height: 48)
                        .background(Color("navy"))
                        .foregroundStyle(Color(.white))
                        .cornerRadius(20)
                        .padding(.top, 24)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    NutritionView()
}

