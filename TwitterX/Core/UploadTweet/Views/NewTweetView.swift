//
//  NewTweetView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/10.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption: String = ""
    @State private var placeholder: String = "What's happening?"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(Color.blue)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Post")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                if caption.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(Color.gray)
                        .onTapGesture {
                            self.placeholder = ""
                        }
                }
                TextEditor(text: $caption)

            }
            .padding()
        }
    }
}

#Preview {
    NewTweetView()
}
