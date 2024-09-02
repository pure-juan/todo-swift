//
//  TodoModel.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import Foundation
import RealmSwift
import WidgetKit

class TodoModel {
    private let realm = RealmManager.shared
    
    func rawList() -> Results<Todo> {
        return realm.db.objects(Todo.self)
    }
    
    func list() -> [Todo] {
        let todos = realm.db.objects(Todo.self).sorted { lhs, rhs in
            if lhs.isDone {
                return false
            } else {
                if lhs.isAllDay != rhs.isAllDay {
                    return true
                }
                return lhs.targetDateTime < rhs.targetDateTime
            }
        }
        
        return todos
    }
    
    func add(todo: Todo) {
        do {
            try realm.db.write {
                realm.db.add(todo)
                WidgetCenter.shared.reloadAllTimelines()
            }
        } catch {
            print(error)
        }
    }
    
    func toggle(todoId: Todo.ID) {
        do {
            if let todo = realm.db.object(ofType: Todo.self, forPrimaryKey: todoId) {
                try realm.db.write {
                    todo.isDone.toggle()
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }
        } catch {
            print(error)
        }
    }
    
    func update(todoId: Todo.ID, todo: Todo) {
        do {
            if let todo = realm.db.object(ofType: Todo.self, forPrimaryKey: todoId) {
                try realm.db.write {
                    todo.content = todo.content
                    todo.targetDateTime = todo.targetDateTime
                    todo.isAllDay = todo.isAllDay
                    todo.isDone = todo.isDone
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }
        } catch {
            print(error)
        }
    }
    
    func remove(todoId: Todo.ID) {
        do {
            if let todo = realm.db.object(ofType: Todo.self, forPrimaryKey: todoId) {
                try realm.db.write {
                    realm.db.delete(todo)
                }
            }
        } catch {
            print(error)
        }
    }
}
