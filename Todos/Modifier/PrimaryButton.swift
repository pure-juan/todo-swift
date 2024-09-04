//
//  PrimaryButton.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
    }
}

//#Preview {
//    PrimaryButton()
//}
