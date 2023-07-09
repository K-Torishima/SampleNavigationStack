//
//  NavigationModifier.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/09.
//

import SwiftUI

// Navigationによる画面遷移の場合はこれでいい
struct NavigationModifier: ViewModifier {
    
    @Binding var path: [Route]
    
    @ViewBuilder
    private func routing(_ route: Route) -> some View {
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
    
    func body(content: Content) -> some View {
        NavigationStack(path: $path) {
            content
                .navigationDestination(for: Route.self) { route in
                    routing(route)
                }
        }
    }
}

extension View {
    func navigate(path: Binding<[Route]>) -> some View {
        self.modifier(NavigationModifier(path: path))
    }
}
