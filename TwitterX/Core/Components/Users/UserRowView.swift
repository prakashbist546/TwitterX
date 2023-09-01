//
//  UserRowView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/10.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 15) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("jocker")
                    .font(.headline).bold()
                    .foregroundStyle(Color.black)
                
                Text("Heath Ledger")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
                
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    UserRowView()
}
