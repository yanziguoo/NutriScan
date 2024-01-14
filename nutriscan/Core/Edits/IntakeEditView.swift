//
//  IntakeEditView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct IntakeEditView: View {
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Section {
                        VStack {
                            Text("Feature Coming Soon")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.red))

                        }
                    }
                    
                    NutrientsData(a: "", b: "", c: "", d: "", e: "", f: "", g: "", h: "", i: "", j: "", isIntake: true)
                    
                    Section {
                            Text("Save")
                                .frame(width: UIScreen.main.bounds.width - 50, height: 48)
                                .background(Color(.gray))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.white))
                                .cornerRadius(10)
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
                    Image("profile")
                }
            }
        }
    }
}

#Preview {
    IntakeEditView()
}
