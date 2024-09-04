//
//  Font.swift
//  Todos
//
//  Created by 찌오 on 9/4/24.
//

import SwiftUI

extension Font {
    static let headlineNormal = Font.system(size: 34)
    static let headlineBold = headlineNormal.bold()
    
    static let mediumNormal = Font.system(size: 18)
    static let mediumBold = mediumNormal.bold()
    
    static let normal = Font.system(size: 14)
    static let normalBold = normal.bold()
    
    static let captionNormal = Font.system(size: 12)
    static let captionBold = captionNormal.bold()
}
