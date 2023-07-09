//
//  ModalModifier.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

// sheetで表示したいときはもう少し調べないといけない
// sheet表示の場合はPath定義してあるRootを指定して表示することは可能だかNavigationのパスには入らないのでStackされない
// StackしたいならNavigationStackみたいなものを作らないといけない
struct ModalModifier: ViewModifier {
    var route: Route
    @Binding var isPresented: Bool
    
    @ViewBuilder
    private func sheet(_ route: Route) -> some View {
        switch route {
        case .detail:
            DetailView()
        case .profile(let id):
            UserView(id: id)
        case .web(let url):
            VStack {
                Text("URL: \(url.absoluteString)")
                Link("Link", destination: url)
            }
        }
    }
    
    // Item渡したかったらここで実装
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                sheet(route)
            }
    }
}

extension View {
    func showSheet(route: Route, isPresented: Binding<Bool>) -> some View {
        self.modifier(ModalModifier(route: route, isPresented: isPresented))
    }
}
