//
//  ProfileView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/10.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButton
            
            userInfoView
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .leading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
        
    }
    
    var actionButton: some View {
        HStack(spacing: 12) {
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay {
                    Circle().stroke(Color.gray, lineWidth: 0.75)
                }
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
            
        }
        .padding(.trailing)
    }
    
    var userInfoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Heath Ledger")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            
            Text("@jocker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your dad's favourite villan")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gotham, NewYork")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.iamjocker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 24) {
                HStack {
                    Text("43")
                        .font(.subheadline).bold()
                    
                    Text("Following")
                        .font(.caption)
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
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(selectedFilter == item ? .semibold: .regular )
                        .foregroundColor(selectedFilter == item ? .black : .gray )
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundStyle(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                        .foregroundStyle(Color(.white))
                        .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x:0, y:16))
        .padding(.vertical)
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self ){ _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}
