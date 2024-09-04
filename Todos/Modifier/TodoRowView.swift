//
//  TodoColumn.swift
//  Todos
//
//  Created by 찌오 on 8/29/24.
//

import SwiftUI

struct ListRow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .background(Color.background)
            .cornerRadius(4)
    }
}

extension View {
    func todoRow() -> some View {
        self.modifier(ListRow())
    }
}
