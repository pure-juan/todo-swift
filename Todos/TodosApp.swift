//
//  TodosApp.swift
//  Todos
//
//  Created by 찌오 on 8/29/24.
//

import SwiftUI

@main
struct TodosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootScreen()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationWillEnterForeground(_ application: UIApplication) {
        NotificationManager.instance.clearBadge()
    }
}
