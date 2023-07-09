//
//  ChildView4.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

struct ChildView4: View {
    @Binding var path: [Int]
    
    var body: some View {
        List{
            Text("遷移\(path.count)回目")
            
            Button {
                let num = Int(path.count + 1)
                path.append(num)
            } label: {
                Text("Viewを追加し遷移する")
            }
            
            Button {
                path.removeLast()
            } label: {
                Text("最後に追加したViewを消す: \(path.count)")
            }
            Button {
                path.removeAll()
            } label: {
                Text("スタックされているViewを全て消す")
            }
            .onChange(of: path) {
                print("path", path)
            }
        }
        .navigationTitle("ChildView4")
        .navigationBarBackButtonHidden(false)
    }
}
