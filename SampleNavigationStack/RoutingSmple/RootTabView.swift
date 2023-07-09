//
//  RootTabView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject var rootEnvironment: RootEnvironment
    
    var body: some View {
        TabView(selection: rootEnvironment.tabSelection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(RootTabs.home)
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(RootTabs.search)
            MyPageView()
                .tabItem {
                    Label("MyPage", systemImage: "person")
                }
                .tag(RootTabs.mypage)
        }
    }
}

#Preview {
    RootTabView()
}
