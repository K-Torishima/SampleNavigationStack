//
//  Route.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import Foundation

enum Route: Hashable {
    case detail
    case profile(id: String)
    case web(url: URL)
}

enum RootTabs: Hashable {
    case home
    case search
    case mypage
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .mypage:
            return "MyPage"
        }
    }
}


