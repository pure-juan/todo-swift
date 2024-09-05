//
//  Setting.swift
//  Todos
//
//  Created by 찌오 on 9/6/24.
//

import Foundation
import RealmSwift

class Setting: Equatable, Codable {
    static func == (lhs: Setting, rhs: Setting) -> Bool {
        return lhs.allowAddPastTodo == rhs.allowAddPastTodo
    }
    
    var allowAddPastTodo: Bool = false
    
    init() {
        
    }
    
    init(allowAddPastTodo: Bool) {
        self.allowAddPastTodo = allowAddPastTodo
    }
}
