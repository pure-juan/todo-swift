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
        
        todoModel.add(todo: Todo(content: content, targetDateTime: targetDateTime, isAllDay: isAllDay))
    }
    
    func validate() -> Bool {
        return !content.isEmpty
    }
}
