//
//  ListRow.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import Foundation
import SwiftUI

extension View {
    func plainListRow() -> some View {
        self
//            .listRowSeparator(.hidden)
            .listRowInsets(.none)
            .listRowBackground(Color.clear)
    }
}
