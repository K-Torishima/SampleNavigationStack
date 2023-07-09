//
//  ThirdView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/05.
//

import SwiftUI

struct ThirdView: View {
    
    @State private var path: [String] = []
    @State private var langs: [String] = ["Swift","Kotlin","Dart"]

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(langs, id: \.self) { lang in
                    NavigationLink(lang, value: lang)
                }
                
                Button {
                    // pathにデータを入れてあげれば遷移する
                    path.append("Objective-C")
                } label: {
                    Text("path Add Objective-C")
                }
            }
            // 型を指定し、行ってほしい画面を設定すると遷移する
            .navigationDestination(for: String.self) { text in
                ChildView3(path: $path, text: text)
            }
            // 同じ型だと先に指定している方が優先される
            .navigationDestination(for: Int.self) { text in
                ChildView2(text: "\(text)")
            }

            .navigationTitle("ThirdView")
        }
        .onChange(of: path) {
            print(path)
        }
    }
}

#Preview {
    ThirdView()
}
