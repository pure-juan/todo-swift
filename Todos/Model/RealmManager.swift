//
//  RealmManager.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import Foundation
import RealmSwift

class RealmManager {
    private init() {}
    
    static let shared: RealmManager = .init()
    
    static var config: Realm.Configuration {
        let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.update.doit.realm")
        let realmURL = container?.appendingPathComponent("default.realm")
        let config = Realm.Configuration(fileURL: realmURL, schemaVersion: 1)
        return config
    }
    
    var db: Realm {
        return try! Realm(configuration: RealmManager.config)
    }
}
