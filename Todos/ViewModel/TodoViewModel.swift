//
//  TodoViewModel.swift
//  Todos
//
//  Created by 찌오 on 9/1/24.
//

import Foundation
import RealmSwift

final class TodoViewModel: BaseViewModel {
    enum Action {
//        case load
        case toggleTodo(id: Todo.ID)
        case removeTodo(id: Todo.ID)
    }
    
    func send(_ action: Action) {
        switch action {
//        case .load:
//            do {
//                let realm = try Realm()
//                
//                self.todos = realm.objects(Todo.self)
//            } catch {
//                print(error)
//            }
        case let .toggleTodo(todoId):
            do {
                let realm = try Realm()
                
                if let todo = realm.object(ofType: Todo.self, forPrimaryKey: todoId) {
                    try realm.write {
                        objectWillChange.send()
                        todo.isDone.toggle()
                    }
                }
            } catch {
                print(error)
            }
        case let .removeTodo(todoId):
            do {
                let realm = try Realm()
                
                if let todo = realm.object(ofType: Todo.self, forPrimaryKey: todoId) {
                    try realm.write {
                        realm.delete(todo)
                    }
//                    send(.load)
                }
            } catch {
                print(error)
            }
        }
    }
}
