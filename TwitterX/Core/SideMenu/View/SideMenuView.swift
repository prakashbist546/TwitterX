//
//  SideMenuView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/10.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.title)
                    Text("@batman")
                        .font(.title3)
                        .foregroundStyle(Color.gray)
                }
                UserStatView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        authViewModel.signout()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    SideMenuView()
}
