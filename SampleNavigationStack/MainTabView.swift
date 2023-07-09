//
//  MainTabView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/05.
//

import SwiftUI

// TabBarで考慮しなければならないこと
// 画面遷移している状態でTabアイコンを押すとRootに戻るようにする
// 画面の中にリストがある場合一番上にスクロールする
// SwiftUIだと直t簡単には行かないかもしれない

struct MainTabView: View {
    
    enum Tabs {
        case first
        case second
        case third
        case fourth
        case fifth
    }
    
    // Tabの初期値
    @State private var selection: Tabs = .fifth
    // Tabの中間のパイプを作成し、そこに流れる値を監視する
    // ReduxならTabStateとかで監視できると思う
    // https://qiita.com/YusukeHosonuma/items/dc986c408e14106caf29
    // 画面でイベントを分けれるようにできると良さそう
    // 画面遷移の時にTabを押してもう一回押すとRootに戻る
    // 画面の中にScroll ViewがあったらScrollViewtopできるようにするとか
    // これはBindingの拡張として実装しても良さそう
    // https://dev.classmethod.jp/articles/swiftui-tabview-select/
    // https://designcode.io/swiftui-handbook-tabbar-scroll-to-top
    private var interceptor: Binding<Tabs> {
        Binding(
            get: { selection },
            set: {
                // 同じタブが呼ばれたら発火
                if selection == $0 {
                    switch selection {
                    case .first:
                        print("firstTabが複数回タップされています")
                    case .second:
                        print("secondが複数回タップされています")
                    case .third:
                        print("thirdが複数回タップされています")
                    case .fourth:
                        print("fourthが複数回タップされています")
                    case .fifth:
                        print("fifthが複数回タップされています")
                    }
                }
                if selection != $0 {
                    print("1回タップされました")
                }
                selection = $0
            }
        )
    }
    
    var body: some View {
        TabView(selection: interceptor) {
            FirstView()
                .tabItem {
                    VStack {
                        Image(systemName: "1.circle")
                        Text("FirstView")
                    }
                }
                .tag(Tabs.first)
            SecondView()
                .tabItem {
                    VStack {
                        Image(systemName: "2.circle")
                        Text("SecondView")
                    }
                }
                .tag(Tabs.second)
            
            
            
            ThirdView()
                .tabItem {
                    VStack {
                        Image(systemName: "3.circle")
                        Text("ThirdView")
                    }
                }
                .tag(Tabs.third)
            FourthView()
                .tabItem {
                    VStack {
                        Image(systemName: "4.circle")
                        Text("FourthView")
                    }
                }
                .tag(Tabs.fourth)
            FifthView()
                .tabItem {
                    VStack {
                        Image(systemName: "5.circle")
                        Text("FifthView")
                    }
                }
                .tag(Tabs.fifth)
        }
        .onAppear()
    }
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
}

#Preview {
    MainTabView()
}
