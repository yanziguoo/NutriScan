//
//  LoginView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var pwd = ""
//    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // logo
                Image("pizza")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                // fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $pwd,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in
                
                NavigationLink (destination: HomeView()) {
                    Text("SIGN IN")
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        .background(Color("navy"))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.white))
                        .cornerRadius(10)
                        .padding(.top, 24)
                }
                
                Spacer()
                
                // sign up
                
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up!")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
