//
//  Todo.swift
//  Todos
//
//  Created by 찌오 on 8/29/24.
//

import Foundation
import RealmSwift

class Todo: Object, Identifiable {
    @Persisted(primaryKey: true) var id: UUID = UUID()
    @Persisted var content: String = ""
    @Persisted var targetDateTime: Date = Date()
    @Persisted var isAllDay: Bool = false
    @Persisted var isDone: Bool = false
    @Persisted var createdAt: Date = Date()
    
    override init() {
        
    }
    
    init(content: String) {
        self.content = content
    }
    
    convenience init(content: String, targetDateTime: Date = Date(), isAllDay: Bool = false, isDone: Bool = false, createdAt: Date = Date()) {
        self.init(content: content)
        self.targetDateTime = targetDateTime
        self.isAllDay = isAllDay
        self.isDone = isDone
        self.createdAt = createdAt
    }
    
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id &&
        lhs.content == rhs.content &&
        lhs.targetDateTime == rhs.targetDateTime &&
        lhs.isAllDay == rhs.isAllDay &&
        lhs.isDone == rhs.isDone &&
        lhs.createdAt == rhs.createdAt
    }
    
    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(id)
        hasher.combine(content)
        hasher.combine(targetDateTime)
        hasher.combine(isAllDay)
        hasher.combine(isDone)
        hasher.combine(createdAt)
        
        return hasher.finalize()
    }
}
