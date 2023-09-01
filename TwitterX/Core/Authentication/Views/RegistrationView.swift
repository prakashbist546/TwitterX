//
//  RegistrationView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/11.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel:AuthViewModel
    @Environment(\.presentationMode) var presentatioMode
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Get Started", title2: "Create your account")
            
            VStack(spacing: 40) {
                CustomTextField(imageName: "envelope", placeholderText: "Email", isSecureField: false, text: $email)
                
                CustomTextField(imageName: "person", placeholderText: "Username", isSecureField: false, text: $username)
                
                CustomTextField(imageName: "person", placeholderText: "Fullname", isSecureField: false, text: $fullname)
                
                CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentatioMode.wrappedValue.dismiss()
            } label: {
                Text("Already have an account?")
                    .font(.footnote)
                
                Text("Sign In")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
