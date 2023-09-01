//
//  CustomTextField.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/11.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool?
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color(.darkGray))
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                } else {
                    TextField(placeholderText, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

#Preview {
    CustomTextField(imageName: "envelope", placeholderText: "Email", isSecureField: false, text: .constant(""))
}
