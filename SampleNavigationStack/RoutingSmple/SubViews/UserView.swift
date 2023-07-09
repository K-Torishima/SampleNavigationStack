//
//  UserView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var rootEnvironment: RootEnvironment

    let id: String

    var body: some View {
        VStack {
            Image(systemName: "person")
            Text("User: \(id)")
            
            Button {
                rootEnvironment.homePath.removeLast()
            } label: {
                Text("pop")
            }
        }
        .font(.title)
    }
}

