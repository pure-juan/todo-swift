//
//  RootFeature.swift
//  Todos
//
//  Created by Juan Kim on 8/30/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RootFeature {
    
    @Reducer
    enum Path {
        case todoListScreen(TodoFeature)
        case createTodoScreen(TodoFeature)
    }
    
    @ObservableState
    struct State {
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case path(StackActionOf<Path>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
        .forEach(\.path, action: \.path)
    }
    
}
