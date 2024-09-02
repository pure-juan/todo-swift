//
//  TodoFeature.swift
//  Todos
//
//  Created by Juan Kim on 8/29/24.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import RealmSwift

@Reducer
struct TodoFeature {
    @ObservableState
    struct State: Equatable {
        var todos: Array<Todo> = Array()
    }
    
    enum Action {
        case removeButtonTapped(id: UUID)
        case markDoneTapped(id: UUID)
        case submitNewTodoContent(content: String)
        case sortTodos
        case updateDatabase(todo: Todo)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .removeButtonTapped(id):
                if let index = state.todos.firstIndex(where: { $0.id == id }) {
                    state.todos.remove(at: index)
                }
                return .none
            case let .markDoneTapped(id):
                state._$willModify()
                if let index = state.todos.firstIndex(where: { $0.id == id }) {
                    state.todos[index].isDone.toggle()
                }
                
                return .run { send in
                    await send(.sortTodos)
                }
            case let .submitNewTodoContent(content):
                let todo = Todo(content: content)
                state.todos.insert(todo, at: 0)
                
                return .run { send in
                    await send(.updateDatabase(todo: todo))
                    await send(.sortTodos)
                }
            case .sortTodos:
                state.todos.sort {!$0.isDone && $1.isDone }
                return .none
            case let .updateDatabase(todo):
//                let storedTodo = self.realm.object(ofType: Todo.self, forPrimaryKey: todo.id)
//                try! realm.write {
//                    if storedTodo != nil {
//                        print("update todo: \(todo.id)")
//                        storedTodo!.content = todo.content
//                        storedTodo!.isDone = todo.isDone
//                    } else {
//                        print("add new todo")
//                        realm.add(todo)
//                    }
//                }
                return .none
            }
        }
    }
    
}
