//
//  CreateTodoViewModel.swift
//  Todos
//
//  Created by 찌오 on 9/1/24.
//

import Foundation
import RealmSwift

class CreateTodoViewModel: ObservableObject {
    private let todoModel = TodoModel()
    
    @Published var content: String = ""
    @Published var targetDateTime: Date = Date()
    @Published var isAllDay: Bool = false
    
    func add() {
        if !validate() {
            return
        }
        
        let todo = todoModel.add(todo: Todo(content: content, targetDateTime: targetDateTime, isAllDay: isAllDay))
        if let todo = todo {
            var notificationTime = todo.targetDateTime
            if todo.isAllDay {
                notificationTime = todo.targetDateTime.endOfDate()
            }
            NotificationManager.instance.schedule(notification: Notification(id: todo.id, title: "Don’t Forget Today’s Task!", subtitle: "Check [\(todo.content)] now", dateTime: notificationTime))
        }
    }
    
    func validate() -> Bool {
        return !content.isEmpty
    }
}
