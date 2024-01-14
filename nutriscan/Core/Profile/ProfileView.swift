//
//  ProfileView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Section {
                        HStack {
                            Text(User.MOCK_USER.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.white))
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(User.MOCK_USER.name)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(User.MOCK_USER.email)
                                    .font(.footnote)
                                    .foregroundStyle(Color(.gray))
                            }
                        }
                    }
                    
                    Section("Stats") {
                        NavigationLink (destination: LoginView()) {
                            Text("Your Stats for This Month")
                        }
                    }
                    
                    Section("Health") {
                        NavigationLink(destination: IntakeView()) {
                            Text("Daily Intake Limits")
                        }
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
                Image("pink-prof")
            }
        }
    }
}

#Preview {
    ProfileView()
}
