//
//  HomeView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var rootEnvironment: RootEnvironment
    
    var body: some View {
        List {
            
            NavigationLink(value: Route.detail) {
                Text("Detailに遷移")
            }
            NavigationLink(value: Route.web(url: URL(string: "https://google.com")!)) {
                Text("webを開く画面に遷移")
            }
            NavigationLink(value: Route.profile(id: "テストユーザー")) {
                Text("profileに遷移")
            }
            Button("ボタンでDetailに遷移") {
                rootEnvironment.homePath.append(.detail)
            }
        }
        .navigationTitle("Home")
        .navigate(path: $rootEnvironment.homePath)
        .onChange(of: rootEnvironment.homePath) {
            print(rootEnvironment.homePath)
        }
    }
}

#Preview {
    HomeView()
}
