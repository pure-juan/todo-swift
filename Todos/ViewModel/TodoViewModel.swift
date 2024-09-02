//
//  TodoViewModel.swift
//  Todos
//
//  Created by 찌오 on 9/1/24.
//

import Foundation
import RealmSwift

final class TodoViewModel: BaseViewModel {
    private let todoModel = TodoModel()
    
    private var nt: NotificationToken? = nil
    @Published var todos: Results<Todo>? = nil
    
    enum Action {
        case toggleTodo(id: Todo.ID)
        case removeTodo(id: Todo.ID)
    }
    
    func list() {
        self.todos = todoModel.rawList()
    }
    
    func send(_ action: Action) {
        switch action {
        case let .toggleTodo(todoId):
            todoModel.toggle(todoId: todoId)
        case let .removeTodo(todoId):
            todoModel.remove(todoId: todoId)
        }
    }
    
    func onApear() {
        nt = todoModel.rawList()
            .observe { [weak self] (changes: RealmCollectionChange) in
                self?.list()
            }
    }
    
    deinit {
        nt?.invalidate()
    }
}
