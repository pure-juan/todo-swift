//
//  ThemeProtocol.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import Foundation
import SwiftUI

protocol ThemeProtocol {
    var primary: Color { get }
    var primaryForeground: Color { get }
    var secondary: Color { get }
    var secondaryForeground: Color { get }
    
    var background: Color { get }
    var elevated: Color { get }
    
    var textForeground: ColorPalette { get }
    var textDisabled: Color { get }
    
    var toggleBackground: Color { get }
    var toggleForegound: Color { get }
    var toggleBorder: Color { get }
    
    var headline: Font { get }
    var medium: Font { get }
    var normal: Font { get }
    var caption: Font { get }
}
