//
//  Caption.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import SwiftUI

struct Caption: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    func body(content: Content) -> some View {
        content
            .font(themeManager.selectedTheme.caption)
    }
}

extension View {
    func caption() -> some View {
        self.modifier(Caption())
    }
}
