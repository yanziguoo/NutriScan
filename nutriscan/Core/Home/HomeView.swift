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
                        MenuView(text: "Boba")
                        MenuView(text: "Curry")
                        MenuView(text: "Pizza")
                    }
                    
                    NutrientsData(a: "2207.5", b: " 88.9 g", c: "31.8 g", d: "150.5 g", e: "2721.4 mg", f: "3305.2 mg", g: "299.7 mg", h: "295.2 g", i: "31.5 g", j: "39.9 g")
                }
            }
            Spacer()
            
            HStack {
                Image("pink-house")
                NavigationLink(destination: PictureView()) {
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
