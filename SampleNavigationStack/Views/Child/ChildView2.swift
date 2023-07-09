//
//  ChildView2.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/07.
//

import SwiftUI

struct ChildView2: View {
    
    let text: String
    
    var body: some View {
        VStack {
            Text("ChildView2")
            Text(text)
        }
    }
}

#Preview {
    ChildView2(text: "")
}
