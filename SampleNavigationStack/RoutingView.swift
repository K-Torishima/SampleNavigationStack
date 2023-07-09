//
//  RoutingView.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

enum Route: Hashable {
    case view1
    case view2
    case view3
    case view4(String)
}

class RootPath: ObservableObject {
    @Published var path: [Route] = []
}

struct RoutingView: View {
    
    @EnvironmentObject var rootPath: RootPath
    
    var body: some View {
        NavigationStack(path: $rootPath.path) {
            Button {
                rootPath.path.append(.view1)
            } label: {
                Text("遷移1")
            }
            Button {
                rootPath.path.append(.view4("データを注入しました"))
            } label: {
                Text("遷移４")
            }
            .navigationDestination(for: Route.self) { route in
                // 画面遷移を列挙しておくとNavigationLinkで指定されていればどこの画面であろうと遷移できる
                // ただし遷移したい画面にNavigaiton Stackがすでに実装されている場合NavigationDestination宣言に一致するものがないと言われ遷移でいない
                switch route {
                case .view1:
                    View1()
                case .view2:
                    View2()
                case .view3:
                    VStack {
                        Text("View3")
                    }
                case .view4(let text):
                    VStack {
                        Text(text)
                    }
                }
            }
            .navigationTitle(Text("RoutingView"))
        }
    }
}

struct View1: View {
    
    @EnvironmentObject var rootPath: RootPath
    
   var body: some View {
       List {
           Button {
               rootPath.path.append(.view2)
           } label: {
               Text("view2に遷移")
           }
           
       }.navigationTitle(Text("view1"))
   }
}
 
struct View2: View {
    
    @EnvironmentObject var rootPath: RootPath
    
   var body: some View {
       
       Button {
           // 最初に戻りたかったらこれでいい
           rootPath.path.removeAll()
       } label: {
           Text("最初に戻る")
       }
       Button {
           rootPath.path.append(.view3)
       } label: {
           Text("view3")
       }
       
       Text("view2")
           .navigationTitle(Text("view2"))
   }
}

#Preview {
    RoutingView()
}
