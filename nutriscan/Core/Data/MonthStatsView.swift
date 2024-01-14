//
//  MonthStatsView.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-13.
//

import SwiftUI

struct MonthStatsView: View {
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Section {
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
                    
                    Section {
                        Text("Here's how well you abided by your daily intake levels this month!")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.black))
                    }
                }
                Text("23%")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.white))
                    .frame(width: 200, height: 200)
                    .background(Color(.systemRed))
                    .clipShape(Circle())
                    .padding(.bottom, 150)
            }
            Spacer()
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
    MonthStatsView()
}
