//
//  UserStatView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/10.
//

import SwiftUI

struct UserStatView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack {
                Text("43")
                    .font(.subheadline).bold()
                
                Text("Following")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("43.5K")
                    .font(.subheadline).bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    UserStatView()
}
