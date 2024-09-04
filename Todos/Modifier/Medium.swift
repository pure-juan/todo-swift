//
//  Medium.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import SwiftUI

struct Medium: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.mediumBold)
            .foregroundStyle(.textDefault)
    }
}

extension View {
    func medium() -> some View {
        self.modifier(Medium())
    }
}
