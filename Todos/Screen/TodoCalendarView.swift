//
//  TodoCalendarView.swift
//  Todos
//
//  Created by Juan Kim on 9/3/24.
//

import SwiftUI
import RealmSwift

struct TodoCalendarView: View {
    @EnvironmentObject var routeManager: RouteManager
    @ObservedObject var viewModel = TodoCalendarViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    routeManager.path.removeLast()
                } label: {
                    Label("Today Tasks", systemImage: "chevron.left")
                }
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            // TODO: implement custom calendar
            DatePicker("", selection: $viewModel.selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .tint(Color.primaryBackground)
            Divider()
            List {
                ForEach(viewModel.sortedTodos, id: \.self.id) { todo in
                    TodoItemView(todo: todo) { val in
                        viewModel.send(.toggle(todoId: todo.id))
                    }
                    .listRowBackground(Color.clear)
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
