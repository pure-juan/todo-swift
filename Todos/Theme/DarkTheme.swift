//
//  DarkTheme.swift
//  Todos
//
//  Created by Juan Kim on 9/3/24.
//

import Foundation
import SwiftUI

struct DarkTheme: ThemeProtocol {
    var primary: Color { Color(hex: 0x3D5AFE) }
    var primaryForeground: Color { Color(hex: 0xFFFFFF) }
    var secondary: Color { Color(hex: 0xFF6E40) }
    var secondaryForeground: Color { Color(hex: 0xFFFFFF) }
    
    var background: Color { Color(hex: 0x141419) }
    var elevated: Color { Color(hex: 0xFFFFFF) }
    
    var textForeground: ColorPalette { ColorPalette(
        i50: Color(hex: 0x171717),
        i100: Color(hex: 0x2B2B2B),
        i200: Color(hex: 0x575757),
        i300: Color(hex: 0x828282),
        i400: Color(hex: 0xADADAD),
        i500: Color(hex: 0xDADADA),
        i600: Color(hex: 0xE0E0E0),
        i700: Color(hex: 0xE8E8E8),
        i800: Color(hex: 0xF0F0F0),
        i900: Color(hex: 0xF7F7F7),
        i950: Color(hex: 0xFCFCFC)
    ) }
    var textDisabled: Color { Color(hex: 0x7D7D94) }
    
    var toggleBackground: Color { Color(hex: 0x2B2D37) }
    var toggleForegound: Color { Color(hex: 0xDADADA) }
    var toggleBorder: Color { Color(hex: 0x717171) }
    
    var tagBackground: Color { Color(hex: 0x464646) }
    var tagForeground: Color { Color(hex: 0xFFFFFF) }
    
    var headline: Font { .system(size: 34).bold() }
    var medium: Font { .system(size: 18).bold() }
    var normal: Font { .system(size: 14) }
    var caption: Font { .system(size: 12) }
}
