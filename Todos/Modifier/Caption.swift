//
//  Caption.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import SwiftUI

struct Caption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.captionNormal)
            .foregroundStyle(Color.textCaption)
    }
}

extension View {
    func caption() -> some View {
        self.modifier(Caption())
    }
}
