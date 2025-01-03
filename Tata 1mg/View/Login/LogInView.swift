//
//  LogInView.swift
//  Tata 1mg
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var onSubmit = false
    @State private var onSignUp = false
    @State private var isKeyboardVisible = false
    @State private var loginFailed = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                // Conditionally show the image based on keyboard visibility or not
                if !isKeyboardVisible {
                    Image("onBoard_3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }
                
                Text("Sign in to continue")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .padding(.bottom, 10)
                
                VStack(spacing: 15) {
                    CustomTextField(placeholder: "Enter email", text: $email)
                    
                    CustomTextField(placeholder: "Enter password", text: $password, isSecure: true)
                }
                .padding(.horizontal, 20)
                
                CustomButton(title: "Verify") {
                    if authViewModel.logIn(email: email, password: password) {
                        onSubmit = true // Navigate to HomeTabView
                    } else {
                        loginFailed = true // Trigger failure alert or message
                    }
                    
                    if loginFailed {
                        Text("Incorrect email or password. Please try again.")
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                HStack {
                    Text("New User?")
                        .font(.system(size: 14))
                    Button(action: {
                        onSignUp = true
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.orange)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
        .keyboardResponsive(isKeyboardVisible: $isKeyboardVisible) // Apply the keyboard responsive modifier
        .bgNavLink(content: HomeTabView().environmentObject(authViewModel), isAction: $onSubmit)
        //.bgNavLink(content: HomeTabView(), isAction: $onSubmit)
        .bgNavLink(content: SignUpView().environmentObject(authViewModel), isAction: $onSignUp)
        .navigationBarBackButtonHidden()
        //not added
    }
}



struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
