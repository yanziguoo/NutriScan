//
//  RegistrationView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var name = ""
    @State private var pwd = ""
    @State private var confirmPwd = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            //logo
            Image("pizza")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 120)
                .padding(.vertical, 32)
            
            // fields
            VStack(spacing: 24) {
                InputView(text: $name,
                          title: "Name",
                          placeholder: "Enter your name")
                
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                InputView(text: $pwd,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                .autocapitalization(.none)
                
                InputView(text: $confirmPwd,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecureField: true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            NavigationLink (destination: HomeView()) {
                Text("SIGN UP")
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    .background(Color("navy"))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.white))
                    .cornerRadius(10)
                    .padding(.top, 24)
            }
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

#Preview {
    RegistrationView()
}
