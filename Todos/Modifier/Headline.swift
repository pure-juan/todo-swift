//
//  Headline.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import SwiftUI

struct Headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headlineBold)
            .foregroundStyle(Color.textHeadline)
    }
}

extension View {
    func headline() -> some View {
        self.modifier(Headline())
    }
}
