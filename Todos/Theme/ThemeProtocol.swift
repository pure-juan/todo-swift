//
//  ThemeProtocol.swift
//  Todos
//
//  Created by Juan Kim on 8/30/24.
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
}
