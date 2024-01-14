//
//  EditView.swift
//  nutriscan
//
//  Created by Simra Khan on 2024-01-14.
//

import Foundation
import SwiftUI

struct EditView: View {
    let image: UIImage?
    @State private var food = ""

    var body: some View {
        NavigationStack {
            VStack {
                
                Text("We think that you were eating apples")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .padding(.bottom, 4)
                
                Text("Were we correct?")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(Color("baby-pink"))
                                
                NavigationLink (destination: NutritionView()) {
                    Text("Yup, all good!")
                        .frame(width: UIScreen.main.bounds.width - 120, height: 48)
                        .background(Color("navy"))
                        .foregroundStyle(Color(.white))
                        .cornerRadius(20)
                        .padding(.top, 24)
                }
                
                Text("If not, then enter the correct food below")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(Color("baby-pink"))
                
                InputView(text: $food,
                          title: "Correct Food",
                          placeholder: "bananas")
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                NavigationLink (destination: NutritionView()) {
                    Text("Done!")
                        .frame(width: UIScreen.main.bounds.width - 120, height: 48)
                        .background(Color("navy"))
                        .foregroundStyle(Color(.white))
                        .cornerRadius(20)
                        .padding(.top, 24)
                }
            }
        }
    }
}


