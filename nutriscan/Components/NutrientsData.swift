//
//  NutrientsData.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-14.
//

import SwiftUI

struct NutrientsData: View {
    let a, b, c, d, e, f, g, h, i, j: String
    var isIntake = false
    
    var body: some View {
        if isIntake {
            Section ("Nutrient Intake") {
                NutrientView(text: "Calories", num: "0-10 kcal")
                NutrientView(text: "Total Fat", num: "0-5 g")
                NutrientView(text: "Saturated Fat", num: "0-0.3 g")
                NutrientView(text: "Protein", num: "100-1000 g")
                NutrientView(text: "Sodium", num: "0-5 mg")
                NutrientView(text: "Potassium", num: "0-30 mg")
                NutrientView(text: "Cholesterol", num: "0-10 mg")
                NutrientView(text: "Carbohydrates", num: "0-100 g")
                NutrientView(text: "Fiber", num: "0-10 g")
                NutrientView(text: "Sugar", num: "0-20 g")
            }
        }
        else {
            Section ("Nutrient Intake Overview") {
                NutrientView(text: "Calories", num: a)
                NutrientView(text: "Total Fat", num: b)
                NutrientView(text: "Saturated Fat", num: c)
                NutrientView(text: "Protein", num: d)
                NutrientView(text: "Sodium", num: e)
                NutrientView(text: "Potassium", num: f)
                NutrientView(text: "Cholesterol", num: g)
                NutrientView(text: "Carbohydrates", num: h)
                NutrientView(text: "Fiber", num: i)
                NutrientView(text: "Sugar", num: j)
            }
        }
        
    }
}

struct NutrientsData_Previews: PreviewProvider {
    static var previews: some View {
        NutrientsData(a: "", b: "", c: "", d: "", e: "", f: "", g: "", h: "", i: "", j: "")
    }
}

// NutrientsData(a: "", b: "", c: "", d: "", e: "", f: "", g: "", h: "", i: "", j: "", isIntake: true)

// NutrientsData(a: "", b: "", c: "", d: "", e: "", f: "", g: "", h: "", i: "", j: "")
