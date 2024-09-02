//
//  AppView.swift
//  Todos
//
//  Created by Juan Kim on 8/29/24.
//

import Foundation
import SwiftUI
import RealmSwift

struct TodoScreen: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @StateObject var viewModel: TodoViewModel = TodoViewModel()
    @ObservedResults(Todo.self) var todos
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Tasks")
                    .font(.system(size: 34).bold())
                Spacer()
                    .frame(height: 35)
                List {
                    ForEach(todos, id: \.self.id) { todo in
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
                    if todos.isEmpty {
                        VStack {
                            Text("No items")
                                .font(.system(size: 34).bold())
                            Text("Press the plus button to add more")
                                .font(.caption)
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
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
//        .onAppear {
//            viewModel.send(.load)
//        }
    }
}

