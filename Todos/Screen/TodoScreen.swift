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
    
    var sortedTodayTodos: [Todo] {
        return todayTodos.sorted { lhs, rhs in
            if lhs.isDone {
                if rhs.isDone {
                    if lhs.isAllDay != rhs.isAllDay {
                        return false
                    }
                    return lhs.targetDateTime < rhs.targetDateTime
                }
                
                return false
            } else {
                if lhs.isAllDay != rhs.isAllDay {
                    return true
                }
                return lhs.targetDateTime < rhs.targetDateTime
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Today Tasks")
                    .headline()
                Spacer()
                    .frame(height: 35)
                List {
                    ForEach(sortedTodayTodos, id: \.self.id) { todo in
                        TodoItemView(todo: todo, toggle: { _ in
                            viewModel.send(.toggleTodo(id: todo.id))
                        })
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
            
            NavigationLink(value: Route.Page.AddTodo) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(16)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .onAppear {
            viewModel.onApear()
        }
    }
}
