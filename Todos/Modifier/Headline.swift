//
//  Headline.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import SwiftUI

struct Headline: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    func body(content: Content) -> some View {
        content
            .font(themeManager.selectedTheme.headline)
    }
}

extension View {
    func headline() -> some View {
        self.modifier(Headline())
    }
}
