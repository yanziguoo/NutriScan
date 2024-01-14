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
                    
                    NutrientsData(a: "", b: "", c: "", d: "", e: "", f: "", g: "", h: "", i: "", j: "", isIntake: true)
                    
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
