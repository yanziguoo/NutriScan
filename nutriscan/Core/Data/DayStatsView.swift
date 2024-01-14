//
//  DayStatsView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct DayStatsView: View {
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
                        MenuView(text: "Croissant")
                    }
                    
                    NutrientsData(a: "2602.5", b: "110 g", c: "43.5 g", d: "158.7 g", e: "3157.4 mg", f: "3410.2 mg", g: "365.7 mg", h: "340.2 g", i: "34.1 g", j: "51.1 g")
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
    DayStatsView()
}
