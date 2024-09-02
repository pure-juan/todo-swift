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
    
    var textForeground: Color { get }
    var textDisabled: Color { get }
    
    var headline: Font { get }
    var medium: Font { get }
    var normal: Font { get }
    var caption: Font { get }
}
