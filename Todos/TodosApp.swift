//
//  TodosApp.swift
//  Todos
//
//  Created by 찌오 on 8/29/24.
//

import SwiftUI

@main
struct TodosApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            RootScreen()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                NotificationManager.instance.clearBadge()
            default:
                return
            }
        }
    }
}
