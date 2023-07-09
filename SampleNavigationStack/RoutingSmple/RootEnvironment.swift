//
//  RootEnvironment.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

class RootEnvironment: ObservableObject {
    @Published var homePath: [Route] = []
    @Published var searchPath: [Route] = []
    @Published var myPagePath: [Route] = []
    
    @Published var selectedTab: RootTabs = .home
}

extension RootEnvironment {
    
    var tabSelection: Binding<RootTabs> {
        Binding(
            get: {
                self.selectedTab
            },
            set: { newValue in
                self.selectedTab = newValue
            }
        )
    }
    
    func pop(to route: Route) {
        switch selectedTab {
        case .home:
            homePath.removeAll(where: { $0 == route })
        case .search:
            searchPath.removeAll(where: { $0 == route })
        case .mypage:
            myPagePath.removeAll(where: { $0 == route })
        }
    }
}

