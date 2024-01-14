//
//  HomeView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Section {
                        VStack {
                            HStack {
                                Text("Hey,")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.black))
                                Text("Yanzi!")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.systemBlue))
                            }

                        }
                    }
                    
                    Section("Here's what you ate today:") {
                        MenuView(text: "Banana")
                        MenuView(text: "Apple")
                        MenuView(text: "Pizza")
                    }
                    
                    Section("Nutrient Intake Overview") {
                        NutrientView(text: "Banana", num: "1")
                        NutrientView(text: "Apple", num: "2")
                        NutrientView(text: "Pizza", num: "3")
                    }
                }
            }
            Spacer()
            
            HStack {
                Image("pink-house")
                NavigationLink(destination: LoginView()) {
                    Image("camera")
                        .padding(.horizontal, 60)
                }
                NavigationLink(destination: ProfileView()) {
                    Image("profile")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
