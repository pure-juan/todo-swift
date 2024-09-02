//
//  TodoItemView.swift
//  Todos
//
//  Created by Juan Kim on 8/29/24.
//

import SwiftUI

struct TodoItemView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var todo: Todo
    let toggle: (Bool) -> ()
    
    var body: some View {
        HStack {
            Toggle("", isOn: Binding(
                get: { todo.isDone },
                set: { _ in toggle(!todo.isDone) }
            ))
                .toggleStyle(ToggleCheckboxStyle())
            Text(todo.content)
                .strikethrough(todo.isDone)
                .foregroundStyle(themeManager.selectedTheme.textForeground)
                .bold()
        }
        .todoRow()
        .background(themeManager.selectedTheme.background)
    }
}

#Preview {
    TodoItemView(todo: Todo(content: "This is todo content"), toggle: { _ in })
}
