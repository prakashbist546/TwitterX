//
//  MainTabView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/10.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
            
            ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            NotificationsView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "bell")
                }
            
            MessegesView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                }
        }
    }
}

#Preview {
    MainTabView()
}
