//
//  BaseViewModel.swift
//  Todos
//
//  Created by 찌오 on 9/1/24.
//

import Foundation

protocol BaseViewModel: ObservableObject {
    associatedtype Action
    
    func send(_ action: Action)
}
