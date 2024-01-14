//
//  WarningsView.swift
//  nutriscan
//
//  Created by Simra Khan on 2024-01-13.
//

import Foundation
import SwiftUI

struct WarningsView: View {
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Section {
                        VStack {
                                Text("Careful!")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.systemBlue))
                                Text("Are you staying within the suggested ranges?")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.black))
                                .padding(.horizontal, 11)
                        }
                    }
                    
                    HStack {
                        Text("Calories")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                        
                        Spacer()
                        
                        Text("2602.5")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                    }
                    HStack {
                        Text("Total Fat")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                        
                        Spacer()
                        
                        Text("110 g")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                    }
                    HStack {
                        Text("Saturated Fat")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                        
                        Spacer()
                        
                        Text("43.5 g")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                    }
                    HStack {
                        Text("Protein")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                        
                        Spacer()
                        
                        Text("158.7 g")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                    }
                    HStack {
                        Text("Sodium")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                        
                        Spacer()
                        
                        Text("3157.4 mg")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                    }
                    HStack {
                        Text("Potassium")
                            .font(.subheadline)
                            .foregroundStyle(Color(.gray))
                        
                        Spacer()
                        
                        Text("3410.2 mg")
                            .font(.subheadline)
                            .foregroundStyle(Color(.gray))
                    }
                    HStack {
                        Text("Cholesterol")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                        
                        Spacer()
                        
                        Text("365.7.4 mg")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                    }
                    HStack {
                        Text("Carbohydrates")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                        
                        Spacer()
                        
                        Text("340.2 g")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                    }
                    HStack {
                        Text("Fiber")
                            .font(.subheadline)
                            .foregroundStyle(Color(.gray))
                        
                        Spacer()
                        
                        Text("34.1 g")
                            .font(.subheadline)
                            .foregroundStyle(Color(.gray))
                    }
                    HStack {
                        Text("Sugar")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                        
                        Spacer()
                        
                        Text("51.1 g")
                            .font(.subheadline)
                            .foregroundStyle(Color(.red))
                    }
                    
                }
                NavigationLink (destination: DayStatsView()) {
                    Text("Home")
                        .frame(width: UIScreen.main.bounds.width - 120, height: 48)
                        .background(Color("navy"))
                        .foregroundStyle(Color(.white))
                        .cornerRadius(20)
                        .padding(.top, 24)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    WarningsView()
}
