//
//  SecondView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/05.
//

import SwiftUI

struct SampleData: Hashable, Identifiable {
    let id: UUID = UUID()
    let text: String
}

struct SecondView: View {
    
    @State private var path: [SampleData] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            Text("NavigationStackのpathを使った遷移")
            Button("Path遷移") {
                path = [.init(text: "テスト画面１を表示🍍")]
            }
            Button("Path遷移") {
                path = [.init(text: "テスト画面２を表示している🍎")]
            }
            
            .navigationTitle("SecondView")
            .navigationDestination(for: SampleData.self) { data in
                ChildView2(text: data.text)
            }
        }
        .onChange(of: path) {
            print("pathを表示", path)
        }
    }
    
}

#Preview {
    SecondView()
}
