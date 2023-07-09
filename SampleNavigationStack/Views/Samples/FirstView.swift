//
//  FirstView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/05.
//

import SwiftUI

struct Child: Hashable, Identifiable {
    var id: UUID = UUID()
    let text: String
}


// 同じような繊維が大量にありデータを流し込むだけの場合方指定して遷移できるようになる
// シンプルなリストだけならこれでいいかもしれない
struct FirstView: View {
    
    let childs: [Child] = [.init(text: "view1"), .init(text: "view2"), .init(text: "view3")]
    let childs2: [Child] = [.init(text: "view4"), .init(text: "view5"), .init(text: "view6")]
    
    var body: some View {
        NavigationStack {
            List {
                Text("Destinationでデータを渡す")
                Section("section1") {
                    ForEach(childs) { child in
                        NavigationLink(child.text, value: child)
                    }
                }
                
                Section("section2") {
                    ForEach(childs2) { data in
                        NavigationLink(data.text, value: data)
                    }
                }
            }
            // ここでデータを渡してあげるだけで良い
            .navigationDestination(for: Child.self) { value in
                ChildView1(text: value.text)
            }
            .navigationTitle("FirstView")
        }
    }
}

#Preview {
    FirstView()
}
