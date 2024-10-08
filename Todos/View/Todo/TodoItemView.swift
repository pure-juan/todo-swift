//
//  TodoItemView.swift
//  Todos
//
//  Created by 찌오 on 8/29/24.
//

import SwiftUI

struct TodoItemView: View {
    var todo: Todo
    let toggle: (Bool) -> ()
    
    private var formatter: DateFormatter {
        let format = DateFormatter()
        format.dateFormat = "~ HH:mm"
        return format
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Toggle("", isOn: Binding(
                get: { todo.isDone },
                set: { _ in toggle(!todo.isDone) }
            ))
            .toggleStyle(ToggleCheckboxStyle())
            Spacer()
                .frame(width: 10)
            VStack(alignment: .leading) {
                Text(todo.content)
                    .strikethrough(todo.isDone)
                    .foregroundStyle(todo.isDone ? Color.textDisabled : Color.textDefault)
                    .bold()
                Text(todo.isAllDay ? "all day" : formatter.string(from: todo.targetDateTime))
                    .foregroundStyle(Color.textDisabled)
                    .strikethrough(todo.isDone)
                    .caption()
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 3)
        }
        .todoRow()
        .background(Color.background)
        .onTapGesture {
            toggle(!todo.isDone)
        }
    }
}

#Preview {
    TodoItemView(todo: Todo(content: "This is todo content"), toggle: { _ in })
}
