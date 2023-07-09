//
//  SampleNavigationStackApp.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/05.
//

import SwiftUI

@main
struct SampleNavigationStackApp: App {
    var body: some Scene {
        WindowGroup {
            //MainTabView()
            RoutingView()
                .environmentObject(RootPath())
        }
    }
}
