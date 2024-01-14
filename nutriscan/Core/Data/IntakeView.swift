//
//  HomeView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct IntakeView: View {
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Section {
                        VStack {
                            Text("Your Daily Intake Limits:")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.black))

                        }
                    }
                    
                    Section {
                        NutrientView(text: "Banana", num: "1")
                        NutrientView(text: "Apple", num: "2")
                        NutrientView(text: "Pizza", num: "3")
                    }
                }
            }
            Spacer()
            
            HStack {
                NavigationLink(destination: HomeView()) {
                    Image("home")
                }
                NavigationLink(destination: LoginView()) {
                    Image("camera")
                        .padding(.horizontal, 60)
                }
                NavigationLink(destination: ProfileView()) {
                    Image("pink-prof")
                }
            }
        }
    }
}

#Preview {
    IntakeView()
}
