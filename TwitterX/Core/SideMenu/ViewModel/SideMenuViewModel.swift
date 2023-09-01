//
//  SideMenuViewModel.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/10.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case lists
    case bookmarks
    case logout
    
    var title: String {
        switch self {
            
        case .profile:
            return "Profile"
        case .lists:
            return "Lists"
        case .bookmarks:
            return "Bookmarks"
        case .logout:
            return "Logout"
        }
    }
    
    var imagename: String {
        switch self {
            
        case .profile:
            return "person"
        case .lists:
            return "list.bullet"
        case .bookmarks:
            return "bookmark"
        case .logout:
            return "arrow.left.square"
        }
    }
}
