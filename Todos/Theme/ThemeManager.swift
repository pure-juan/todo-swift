//
//  ThemeManager.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import Foundation

class ThemeManager: ObservableObject {
    @Published var selectedTheme: ThemeProtocol = LightTheme()
    
    func setTheme(theme: ThemeProtocol) {
        selectedTheme = theme
    }
}
