//
//  RootNavigationView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/05.
//

import SwiftUI

struct RootNavigationView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                ContentView()
            } label: {
                Text("Tabが実装されていない画面")
            }
            
            NavigationLink {
                MainTabView()
            } label: {
                Text("tabが実装されている画面")
            }
        }
    }
}

#Preview {
    RootNavigationView()
}
