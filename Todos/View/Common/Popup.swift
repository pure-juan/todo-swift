//
//  Popup.swift
//  Todos
//
//  Created by Juan Kim on 9/9/24.
//

import SwiftUI

struct Popup<Content>: View where Content: View {
    @Binding var isPresent: Bool
    @ViewBuilder let content: Content
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Popup()
}
