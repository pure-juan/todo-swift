//
//  SettingScreen.swift
//  Todos
//
//  Created by Juan Kim on 9/4/24.
//

import SwiftUI

struct SettingScreen: View {
    @EnvironmentObject var themeManager: ThemeManager
    var body: some View {
        VStack {
            Button {
                print("touched")
            } label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Remove past todos")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(themeManager.selectedTheme.secondary)
                .foregroundStyle(themeManager.selectedTheme.secondaryForeground)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .background(themeManager.selectedTheme.background)
    }
}

#Preview {
    SettingScreen()
}
