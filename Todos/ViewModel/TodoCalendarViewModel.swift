//
//  TodoCalendarViewModel.swift
//  Todos
//
//  Created by Juan Kim on 9/5/24.
//

import Foundation
import RealmSwift

class TodoCalendarViewModel: ObservableObject {
    @Published var selectedDate: Date = Date() {
        didSet {
            send(.load(selectedDate))
        }
    }
    @Published var todos: Results<Todo>? = nil
    @Published var sortedTodos: [Todo] = []
    var todoModel = TodoModel()
    
    enum Action {
        case load(Date)
        case sort
        case toggle(todoId: Todo.ID)
    }
    
    func send(_ action: Action) {
        switch action {
        case .load(let date):
            todos = todoModel.list(date: date)
            send(.sort)
        case .sort:
            if todos != nil {
                sortedTodos = todos!.sorted(by: { lhs, rhs in
                    // If one task is done and the other isn't, done tasks should go down
                    if lhs.isDone != rhs.isDone {
                        return !lhs.isDone // true means it should go down
                    }
                    
                    // If both tasks have the same done status, compare based on all-day status
                    if lhs.isAllDay != rhs.isAllDay {
                        return lhs.isAllDay // all-day tasks should come before non-all-day tasks
                    }
                    
                    // If both tasks have the same all-day status, compare based on created date
                    if lhs.isAllDay {
                        return lhs.createdAt <= rhs.createdAt
                    }
                    
                    // If both tasks are not all-day, compare based on target date and time
                    return lhs.targetDateTime <= rhs.targetDateTime
                })
            }
        case .toggle(let todoId):
            todoModel.toggle(todoId: todoId)
            send(.load(selectedDate))
        }
    }
    
    init() {
        send(.load(selectedDate))
    }
}
