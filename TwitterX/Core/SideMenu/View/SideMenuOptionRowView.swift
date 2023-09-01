//
//  SideMenuOptionRowView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/10.
//

import SwiftUI

struct SideMenuOptionRowView: View {

    let viewModel: SideMenuViewModel
    
    var body: some View {
            HStack(spacing: 16) {
                Image(systemName: viewModel.imagename)
                    .font(.title)
                    .foregroundStyle(Color.gray)
                
                Text(viewModel.title)
                    .font(.title2)
                    .foregroundStyle(Color.black)
                
                Spacer()
            }
            .frame(height: 40)
            .padding(.horizontal)
        }
}

#Preview {
    SideMenuOptionRowView(viewModel: .profile)
}
