//
//  FourthView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

// 複数の画面を跨いで戻る
struct FourthView: View {
    
    @State private var path: [Int] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button {
                    path.append(path.count + 1)
                } label: {
                    Text("Add Number")
                }
            }
            .navigationDestination(for: Int.self) { number in
                ChildView4(path: $path)
            }
            .navigationTitle("FourthView")
        }
        .onChange(of: path) {
            print("path", path)
        }
    }
}

#Preview {
    FourthView()
}
