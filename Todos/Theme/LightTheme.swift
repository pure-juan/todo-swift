//
//  LightTheme.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import Foundation
import SwiftUI

struct LightTheme: ThemeProtocol {
    var primary: Color { Color(hex: 0x3D5AFE) }
    var primaryForeground: Color { Color(hex: 0xFFFFFF) }
    var secondary: Color { Color(hex: 0xFF6E40) }
    var secondaryForeground: Color { Color(hex: 0xFFFFFF) }
    
    var background: Color { Color(hex: 0xFFFFFF) }
    var elevated: Color { Color(hex: 0xFFFFFF) }
    
    var textForeground: Color { Color(hex: 0x575767) }
    var textDisabled: Color { Color(hex: 0x737373) }
    
    var headline: Font { .system(size: 34).bold() }
    var medium: Font { .system(size: 18).bold() }
    var normal: Font { .system(size: 14) }
    var caption: Font { .system(size: 12) }
}
