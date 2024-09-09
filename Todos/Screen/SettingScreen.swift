//
//  SettingScreen.swift
//  Todos
//
//  Created by Juan Kim on 9/4/24.
//

import SwiftUI

struct SettingScreen: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Text("Danger zone")
                        .foregroundStyle(Color.red)
                        .medium()
                }
                Button {
                    print("touched")
                } label: {
                    HStack {
                        Image(systemName: "trash")
                        Text("Remove all todos")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .background(Color.background)
    }
}

#Preview {
    SettingScreen()
}
