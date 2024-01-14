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
                    
                    NutrientsData(a: "324 kcal", b: " 5 g", c: "0.3 g", d: "100 g", e: "5 mg", f: "20 mg", g: "5 mg", h: "15 g", i: "2 g", j: "10 g")
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
