//
//  WelcomeView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // logo
                Image("pizza")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                    .padding(.top, 150)
                
                Text("Welcome to")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .padding(.bottom, 4)
                
                Text("NutriScan")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(Color("baby-pink"))
                
                // continue
                
                NavigationLink (destination: LoginView()) {
                    Text("Continue")
                        .frame(width: UIScreen.main.bounds.width - 120, height: 48)
                        .background(Color("navy"))
                        .foregroundStyle(Color(.white))
                        .cornerRadius(20)
                        .padding(.top, 24)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
