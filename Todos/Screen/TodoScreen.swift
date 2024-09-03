//
//  AppView.swift
//  Todos
//
//  Created by 찌오 on 8/29/24.
//

import Foundation
import SwiftUI
import RealmSwift

struct TodoScreen: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @StateObject var viewModel: TodoViewModel = TodoViewModel()
    @ObservedResults(
        Todo.self,
        filter: NSPredicate(format: "targetDateTime BETWEEN {%@, %@}", argumentArray: [Date().startOfDate(), Date().endOfDate()])
    ) var todayTodos
    @ObservedResults(
        Todo.self,
        filter: NSPredicate(format: "targetDateTime >= %@", argumentArray: [Date().tomorrow()]),
        sortDescriptor: SortDescriptor(keyPath: "targetDateTime", ascending: true)
    ) var futureTodos
    @ObservedResults(
        Todo.self,
        filter: NSPredicate(format: "targetDateTime < %@", argumentArray: [Date().startOfDate()]),
        sortDescriptor: SortDescriptor(keyPath: "targetDateTime", ascending: true)
    ) var pastTodos
    
    var sortedTodayTodos: [Todo] {
        return todayTodos.sorted { lhs, rhs in
            // If one task is done and the other isn't, done tasks should go down
            if lhs.isDone != rhs.isDone {
                return !lhs.isDone // true means it should go down
            }
            
            // If both tasks have the same done status, compare based on all-day status
            if lhs.isAllDay != rhs.isAllDay {
                return lhs.isAllDay // all-day tasks should come before non-all-day tasks
            }
            
            // If both tasks have the same all-day status, compare based on created date
            if lhs.isAllDay {
                return lhs.createdAt <= rhs.createdAt
            }
            
            // If both tasks are not all-day, compare based on target date and time
            return lhs.targetDateTime <= rhs.targetDateTime
            //            // Long
            //            if lhs.isDone {
            //                if !rhs.isDone {
            //                    return false
            //                }
            //                if lhs.isAllDay {
            //                    if !rhs.isAllDay {
            //                        return true
            //                    }
            //
            //                    return lhs.createdAt <= rhs.createdAt
            //                } else {
            //                    if rhs.isAllDay {
            //                        return false
            //                    }
            //
            //                    return lhs.targetDateTime <= rhs.targetDateTime
            //                }
            //            } else {
            //                if rhs.isDone {
            //                    return true
            //                }
            //                if lhs.isAllDay {
            //                    if !rhs.isAllDay {
            //                        return true
            //                    }
            //
            //                    return lhs.createdAt <= rhs.createdAt
            //                } else {
            //                    if rhs.isAllDay {
            //                        return false
            //                    }
            //
            //                    return lhs.targetDateTime <= rhs.targetDateTime
            //                }
            //            }
        }
    }
    
    var completedTodos: [Todo] {
        sortedTodayTodos.filter { $0.isDone }
    }
    var incompleteTodos: [Todo] {
        sortedTodayTodos.filter { !$0.isDone }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Today Tasks")
                    .headline()
                Spacer()
                    .frame(height: 35)
                List {
                    if incompleteTodos.isEmpty {
                        Text("No remain todos")
                            .plainListRow()
                    } else {
                        ForEach(incompleteTodos, id: \.self.id) { todo in
                            TodoItemView(todo: todo, toggle: { _ in
                                viewModel.send(.toggleTodo(id: todo.id))
                            })
                            .background(themeManager.selectedTheme.background)
                            .plainListRow()
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    viewModel.send(.removeTodo(id: todo.id))
                                } label: {
                                    Label("삭제", systemImage: "trash")
                                }
                            }
                        }
                    }
                    if !completedTodos.isEmpty {
                        HStack {
                            Spacer()
                                .frame(height: 1)
                                .background(themeManager.selectedTheme.textDisabled)
                            Text("Completed")
                                .caption()
                                .padding(.horizontal, 15)
                                .lineLimit(nil)
                            Spacer()
                                .frame(height: 1)
                                .background(themeManager.selectedTheme.textDisabled)
                        }
                        .plainListRow()
//                        .background(themeManager.selectedTheme.background)
//                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        ForEach(completedTodos, id: \.self.id) { todo in
                            TodoItemView(todo: todo, toggle: { _ in
                                viewModel.send(.toggleTodo(id: todo.id))
                            })
                            .background(themeManager.selectedTheme.background)
                            .plainListRow()
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    viewModel.send(.removeTodo(id: todo.id))
                                } label: {
                                    Label("삭제", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .overlay {
                    if sortedTodayTodos.isEmpty {
                        VStack {
                            Text("No items")
                                .headline()
                            Text("Press the plus button to add more")
                                .caption()
                        }
                    }
                }
            }
            .frame(
                maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding(15)
            
            VStack {
                NavigationLink(value: Route.Page.Calendar) {
                    Image(systemName: "calendar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .padding(16)
                        .background(themeManager.selectedTheme.primary)
                        .foregroundStyle(themeManager.selectedTheme.primaryForeground)
                        .clipShape(Circle())
                }
                NavigationLink(value: Route.Page.AddTodo) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(16)
                        .background(themeManager.selectedTheme.primary)
                        .foregroundColor(themeManager.selectedTheme.primaryForeground)
                        .clipShape(Circle())
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .background(themeManager.selectedTheme.background)
        .onAppear {
            viewModel.onApear()
        }
    }
}
