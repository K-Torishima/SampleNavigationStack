//
//  ChildView3.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/07.
//

import SwiftUI

struct ChildView3: View {
    
    @Binding var path: [String]
    
    let text: String
    var body: some View {
        VStack {
            Text(text)
            Button {
                // 戻る時は格納された最後のパスを削除すると戻れる
                path.removeLast()
            } label: {
                Text("path Remove")
            }
        }
    }
}

#Preview {
    ChildView3(path: .constant([]), text: "")
}
