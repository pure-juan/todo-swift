//
//  LightTheme.swift
//  Todos
//
//  Created by Juan Kim on 8/30/24.
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
}
