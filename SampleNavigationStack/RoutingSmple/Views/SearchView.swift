//
//  SearchView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var rootEnvironment: RootEnvironment
    
    var body: some View {
        List {
            
            NavigationLink(value: Route.detail) {
                Text("Detailに遷移")
            }
        }
        .navigationTitle("SearchView")
        .navigate(path: $rootEnvironment.searchPath)
        .onChange(of: rootEnvironment.searchPath) {
            print(rootEnvironment.searchPath)
        }
    }
}

#Preview {
    SearchView()
}
