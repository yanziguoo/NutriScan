//
//  EditView.swift
//  nutriscan
//
//  Created by Simra Khan on 2024-01-14.
//

import SwiftUI
import PythonKit

struct EditView: View {
    
//    let image: UIImage
    @State private var food = ""

    var body: some View {
        NavigationStack {
            VStack {
                
                Text("We think that you were eating")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                Text("A Croissant!")
                    .fontWeight(.bold)
                    .font(.system(size: 48))
                    .foregroundStyle(Color("baby-pink"))
                    .padding(.bottom, 24)
                
                Text("Were we correct?")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                                
                NavigationLink (destination: NutritionView()) {
                    Text("Yup, all good!")
                        .frame(width: UIScreen.main.bounds.width - 120, height: 48)
                        .background(Color("navy"))
                        .foregroundStyle(Color(.white))
                        .cornerRadius(20)
                }
                // .simultaneousGesture(TapGesture().onEnded{RunPythonScript()})
                
                Text("If not, then enter the what it is below")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundStyle(Color(.gray))
                    .padding(.top, 60)
                    .padding(.bottom, 30)
                
                InputView(text: $food,
                          title: "What is it?",
                          placeholder: "Cereal")
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 60)
                
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

#Preview {
    EditView()
}
