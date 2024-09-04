//
//  Container.swift
//  Todos
//
//  Created by Juan Kim on 9/3/24.
//

import SwiftUI

struct Container<Content>: View where Content: View {
    
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(alignment: .leading) {
            content
        }
        .background(Color.background)
    }
}

#Preview {
    Container {
        Text("Hello")
    }
}
