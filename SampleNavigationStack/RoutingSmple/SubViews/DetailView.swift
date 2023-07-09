//
//  DetailView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/05.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var rootEnvironment: RootEnvironment
    
    @State var showingSheet = false
    
    var body: some View {
        VStack {
            Image(systemName: "note")
            Text("textView")
            
            Text(rootEnvironment.selectedTab.title + "からの遷移")
            
            Button {
                rootEnvironment.pop(to: .detail)
            } label: {
                Text("pop")
            }
            
            Button {
                showingSheet.toggle()
            } label: {
                Text("sheetを表示")
            }
            .showSheet(
                route: .detail,
                isPresented: $showingSheet)
        }
        .font(.title)
    }
}

#Preview {
    DetailView()
}
