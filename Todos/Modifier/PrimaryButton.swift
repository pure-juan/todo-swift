//
//  PrimaryButton.swift
//  Todos
//
//  Created by Juan Kim on 8/30/24.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    @EnvironmentObject var themeManager: ThemeManager
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
    }
}

//#Preview {
//    PrimaryButton()
//}
