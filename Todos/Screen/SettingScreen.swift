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
            Button {
                print("touched")
            } label: {
//                HStack {
//                    Text("Allow to add past todo")
//                    Spacer()
//                    Toggle("", isOn: Binding(
//                        get: { viewModel.setting.allowAddPastTodo },
//                        set: { _ in viewModel.toggleAllowAddPastTodo() }
//                    ))
//                    .toggleStyle(ToggleCheckboxStyle())
//                }
                Spacer()
                HStack {
                    Image(systemName: "trash")
                    Text("Remove past todos")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
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
