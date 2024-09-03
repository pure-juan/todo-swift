//
//  ThemeManager.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import Foundation
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var selectedTheme: ThemeProtocol
    
    func detect(colorScheme: ColorScheme) {
        selectedTheme = colorScheme == .dark ? DarkTheme() : LightTheme()
    }
    
    func setTheme(theme: ThemeProtocol) {
        selectedTheme = theme
    }
    
    init() {
        selectedTheme = LightTheme()
    }
    
    init(theme: ThemeProtocol) {
        selectedTheme = theme
    }
}
