//
//  HealthPlansView.swift
//  Tata 1mg
//
//  Created by Yashom on 22/10/24.
//

import SwiftUI

struct HealthPlansView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Title and Subheading
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Health Plans")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Most upvoted plans, sessions and articles for you!")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    // Horizontal Scrollable Buttons
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(["Diabetes", "Insurance", "Surgical care", "Mental Wellness"], id: \.self) { category in
                                Button(action: {
                                    // Handle button action
                                }) {
                                    Text(category)
                                        .font(.system(size: 16))
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .foregroundColor(Color.primaryText)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                }
                            }
                        }
                        .padding(.horizontal)
                        .frame(height: 60)  // Ensure a fixed height for the button row
                    }
                    
                    
                    // Promotional Card 1: Toothsi by MakeO
                    VStack(alignment: .leading, spacing: 10) {
                        Image("toothsi")  // Replace with actual image asset
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        Text("Toothsi by MakeO")
                            .font(.headline)
                        
                        HStack {
                            Button(action: {
                                // Know more action
                            }) {
                                Text("Know more")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.pink)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            Button(action: {
                                // Get custom plans action
                            }) {
                                Text("Get custom plans")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Promotional Card 2: Twin Health
                    VStack(alignment: .leading, spacing: 10) {
                        Image("twino")  // Replace with actual image asset
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        Text("Stop your Diabetes Medicines & Reverse Diabetes with Twin Health")
                            .font(.headline)
                            .padding(.top, 5)
                        
                        Button(action: {
                            // Enroll now action
                        }) {
                            Text("Enroll Now")
                                .font(.system(size: 16))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Image("birla_firtility")  // Replace with actual image asset
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        Text("Birla Fertility & IVF")
                            .font(.headline)
                        
                        HStack {
                            Button(action: {
                                // Know more action
                            }) {
                                Text("Know more")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.pink)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            Button(action: {
                                // Get custom plans action
                            }) {
                                Text("Get custom plans")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Image("beato")  // Replace with actual image asset
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        Text("Discover a life beyond diets, meds, and insulin with our care program")
                            .font(.headline)
                        
                        HStack {
                            Button(action: {
                                // Know more action
                            }) {
                                Text("Know more")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.pink)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            Button(action: {
                                // Get custom plans action
                            }) {
                                Text("Get custom plans")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
        }
    }
}


struct HealthPlansView_Previews: PreviewProvider {
    static var previews: some View {
        HealthPlansView()
    }
}
