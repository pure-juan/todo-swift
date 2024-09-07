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
    
    func list(date: Date) -> Results<Todo> {
        let todos = realm.db.objects(Todo.self).where {
            $0.targetDateTime.contains(date.startOfDate()...date.endOfDate())
        }
        
        return todos
    }
    
    func add(todo: Todo) -> Todo? {
        do {
            try realm.db.write {
                realm.db.add(todo)
                WidgetCenter.shared.reloadAllTimelines()
            }
            return todo
        } catch {
            print(error)
            return nil
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
