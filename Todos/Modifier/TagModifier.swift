//
//  Tag.swift
//  Todos
//
//  Created by 찌오 on 9/3/24.
//

import SwiftUI

struct TagModifier: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    
    func body(content: Content) -> some View {
        content
            .background(themeManager.selectedTheme.tagBackground)
            .foregroundStyle(themeManager.selectedTheme.tagForeground)
    }
}

extension View {
    func tag() -> some View {
        self.modifier(TagModifier())
    }
}
