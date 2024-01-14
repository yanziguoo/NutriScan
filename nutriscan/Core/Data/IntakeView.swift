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
                    
                    NutrientsData(a: "1800-2400", b: "40-80 g", c: "0-20 g", d: "45-90 g", e: "1800-2300 mg", f: "2500-3400 mg", g: "0-200 mg", h: "225-325 g", i: "15-30 g", j: "0-24 g")
                    
                    Section {
                        NavigationLink (destination: IntakeEditView()) {
                            Text("Edit")
                                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                                .background(Color("navy"))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.white))
                                .cornerRadius(10)
                        }
                    }
                }
            }
            
            Spacer()
            
            HStack {
                NavigationLink(destination: HomeView()) {
                    Image("home")
                }
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
    IntakeView()
}
