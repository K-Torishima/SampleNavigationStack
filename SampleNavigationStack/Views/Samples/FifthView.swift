//
//  FifthView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

// NavigationPathを使う
//https://developer.apple.com/documentation/swiftui/navigationpath
// 複数のデータ型を扱いたい時に使用
// あくまでも画面遷移をするというよりDetaを渡すという感じで考えた方が良さそう。


//　明日やることNavigationPathをもう少し調べる
// 以下の実装を調べる
// https://zenn.dev/chocoyama/articles/32d52cf66dd6ff#%E6%96%B0%E3%81%97%E3%81%84navigation%E3%81%AE%E5%AE%9F%E8%A3%85%E6%96%B9%E6%B3%95

// Routerっぽくできる
// https://stackoverflow.com/questions/74808737/where-to-place-global-navigationpath-in-swiftui
// https://dev.to/gualtierofr/introducing-navigationpath-in-swiftui-3424
// Reduxでどう使うかももう少し考えた方が良さそう

struct FifthView: View {
    
    @State private var path: NavigationPath = NavigationPath()
    @State private var langs: [String] = ["Swift","Kotlin","Dart"]
    
    var body: some View {
        NavigationStack(path: $path) {
            
            List {
                ForEach(langs, id: \.self) { lang in
                    NavigationLink(lang, value: lang)
                }
            }
            .navigationDestination(for: Color.self) { color in
                color.self
            }
            .navigationDestination(for: String.self) { test in
                ChildView5(path: $path, text: test)
            }
            .navigationTitle("FifthView")
        }
        .onChange(of: path) {
            print("path", path)
        }
    }
}

struct ChildView5: View {
    
    // 一気に消すことはできないけど行きたいところにはいけそう
    @Binding var path: NavigationPath
    var text: String
    
    var body: some View {
        List {
            Text(text)
            
            Button {
                path.append(Color.cyan)
            } label: {
                Text("Add Color")
            }
            
            Button {
                path.removeLast()
            } label: {
                Text("remove")
            }
            Button {
                path.append("Objective-C")
            } label: {
                Text("Add Objective")
            }
            
            Button {
                // 遷移した分のパスを全て消す
                path.removeLast(path.count)
            } label: {
                Text("removeAll")
            }
            .navigationTitle("ChildView5")
            // Navigation BackでもDataはremoveされる
            .navigationBarBackButtonHidden(false)
        }
    }
}


#Preview {
    FifthView()
}
