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
    
    var textForeground: ColorPalette { ColorPalette(
        i50: Color(hex: 0xEEEEF1),
        i100: Color(hex: 0xDBDBE1),
        i200: Color(hex: 0xBABAC5),
        i300: Color(hex: 0x9696A6),
        i400: Color(hex: 0x75758A),
        i500: Color(hex: 0x575767),
        i600: Color(hex: 0x464653),
        i700: Color(hex: 0x33333D),
        i800: Color(hex: 0x232329),
        i900: Color(hex: 0x101013),
        i950: Color(hex: 0x09090B)
    ) }
    var textDisabled: Color { Color(hex: 0x737373) }
    
    var toggleBackground: Color { Color(hex: 0xFCFCFC) }
    var toggleForegound: Color { Color(hex: 0x575767) }
    var toggleBorder: Color { Color(hex: 0xDADADA) }
    
    var headline: Font { .system(size: 34).bold() }
    var medium: Font { .system(size: 18).bold() }
    var normal: Font { .system(size: 14) }
    var caption: Font { .system(size: 12) }
}
