//
//  CreateTodoViewModel.swift
//  Todos
//
//  Created by 찌오 on 9/1/24.
//

import Foundation
import RealmSwift

class CreateTodoViewModel: ObservableObject {
    @Published var content: String = ""
    
    func add() {
        if !validate() {
            return
        }
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(Todo(content: self.content))
        }
    }
    
    func validate() -> Bool {
        return !content.isEmpty
    }
}
