//
//  RootView.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import SwiftUI
import RealmSwift

struct RootScreen: View {
    @StateObject var themeManager = ThemeManager()
    @StateObject var navManager = RouteManager()
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            TodoScreen()
                .navigationDestination(for: Route.Page.self) { page in
                    switch page {
                    case .AddTodo:
                        CreateTodoScreen()
                    case .Home:
                        TodoScreen()
                    }
                }
        }
        .environmentObject(themeManager)
        .environmentObject(navManager)
        .environment(\.realmConfiguration, RealmManager.config)
    }
}
