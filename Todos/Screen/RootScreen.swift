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
    @StateObject var navManager = RouteManager()
    
    enum Tab {
        case todo
        case setting
    }
    
    @State var selectedTab: Tab = .setting
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            VStack {
                Group {
                    if selectedTab == .todo {
                        TodoScreen()
                    } else if selectedTab == .setting {
                        SettingScreen()
                    }
                }
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
            }
            .safeAreaInset(edge: .bottom) {
                tabBar
            }
            .background(Color.background)
        }
        .environmentObject(navManager)
        .environment(\.realmConfiguration, RealmManager.config)
    }
    
    @ViewBuilder
    var tabBar: some View {
        HStack {
            Spacer()
            Button {
                selectedTab = .todo
            } label: {
                VStack {
                    Image(systemName: "note.text")
                    Text("Todos")
                }
            }
            .tint(selectedTab == .todo ? Color.tabActiveTint: Color.tabDisableTint)
            Spacer()
            Spacer()
            Button {
                selectedTab = .setting
            } label: {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
            .tint(selectedTab == .setting ? Color.tabActiveTint : Color.tabDisableTint)
            Spacer()
        }
        .padding(.vertical, 15)
        .background(Color.elevatedBackground)
        .frame(maxWidth: .infinity, alignment: .bottom)
        .clipShape(
            RoundedRectangle(cornerRadius: 15)
        )
        .shadow(color: Color.elevatedShadow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, 16)
        .onAppear {
            NotificationManager.instance.askPermission()
        }
    }
}
