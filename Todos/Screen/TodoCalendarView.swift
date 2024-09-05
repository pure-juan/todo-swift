//
//  TodoCalendarView.swift
//  Todos
//
//  Created by Juan Kim on 9/3/24.
//

import SwiftUI
import RealmSwift

struct TodoCalendarView: View {
    @State var date = Date()
    var body: some View {
        VStack {
            // TODO: implement custom calendar
            DatePicker("", selection: $date, displayedComponents: .date)
                .datePickerStyle(.graphical)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.background)
    }
}

#Preview {
    TodoCalendarView()
}
