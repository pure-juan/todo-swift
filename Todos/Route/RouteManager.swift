//
//  NavigationManager.swift
//  Todos
//
//  Created by 찌오 on 9/1/24.
//

import Foundation
import SwiftUI

class RouteManager: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
}
