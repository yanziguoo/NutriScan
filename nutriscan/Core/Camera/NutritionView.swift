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
                    
                    NutrientsData(a: "324 kcal", b: " 5 g", c: "0.3 g", d: "100 g", e: "5 mg", f: "20 mg", g: "5 mg", h: "15 g", i: "2 g", j: "10 g")
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

