//
//  ChildView1.swift
//  SampleNavigationStack
//
//  Created by 鳥嶋 晃次 on 2023/07/05.
//

import SwiftUI

struct ChildView1: View {
    let text: String
    var body: some View {
        Text(text)
    }
}

#Preview {
    ChildView1(text: "")
}
