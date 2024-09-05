//
//  TodoCalendarView.swift
//  Todos
//
//  Created by Juan Kim on 9/3/24.
//

import SwiftUI
import RealmSwift

struct TodoCalendarView: View {
    @ObservedObject var viewModel = TodoCalendarViewModel()
    
    var body: some View {
        VStack {
            // TODO: implement custom calendar
            DatePicker("", selection: $viewModel.selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
            Divider()
            List {
                ForEach(viewModel.sortedTodos, id: \.self.id) { todo in
                    TodoItemView(todo: todo) { val in
                        viewModel.send(.toggle(todoId: todo.id))
                    }
                }
            }
            .listStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.background)
        .onAppear {
            viewModel.send(.load(viewModel.selectedDate))
        }
    }
}

#Preview {
    TodoCalendarView()
}
