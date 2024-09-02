//
//  ThemeManager.swift
//  Todos
//
//  Created by Juan Kim on 8/30/24.
//

import Foundation

class ThemeManager: ObservableObject {
    @Published var selectedTheme: ThemeProtocol = LightTheme()
    
    func setTheme(theme: ThemeProtocol) {
        selectedTheme = theme
    }
}
