//
//  RootView.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import SwiftUI
import RealmSwift

struct RootScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var themeManager = ThemeManager()
    @StateObject var navManager = RouteManager()
    
    enum Tab {
        case todo
        case setting
    }
    
    @State var selectedTab: Tab = .todo
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            VStack {
                TabView(selection: $selectedTab) {
                    TodoScreen()
                        .toolbar(.hidden, for: .bottomBar, .tabBar)
                        .tag(Tab.todo)
                    SettingScreen()
                        .toolbar(.hidden, for: .bottomBar, .tabBar)
                        .tag(Tab.setting)
                }
                .toolbar(.hidden, for: .bottomBar, .tabBar)
                .navigationDestination(for: Route.Page.self) { page in
                    switch page {
                    case .AddTodo:
                        CreateTodoScreen()
                    case .Home:
                        TodoScreen()
                    case .Calendar:
                        TodoCalendarView()
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    tabBar
                }
            }
            .background(themeManager.selectedTheme.background)
        }
        .onAppear {
            themeManager.detect(colorScheme: colorScheme)
        }
        .environmentObject(themeManager)
        .environmentObject(navManager)
        .environment(\.realmConfiguration, RealmManager.config)
    }
    
    @ViewBuilder
    var tabBar: some View {
        HStack {
            Spacer()
            Button {
                print("touched todo")
                selectedTab = .todo
            } label: {
                VStack {
                    Image(systemName: "note.text")
                    Text("Todos")
                }
            }
            Spacer()
            Button {
                print("touched setting")
                selectedTab = .setting
            } label: {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .background(themeManager.selectedTheme.elevated)
        .frame(maxWidth: .infinity,alignment: .bottom)
        .clipShape(
            RoundedRectangle(cornerRadius: 15)
        )
        .padding(.horizontal, 16)
    }
}
