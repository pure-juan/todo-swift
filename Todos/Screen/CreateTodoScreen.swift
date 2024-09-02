//
//  CreateTodoScreen.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import SwiftUI

struct CreateTodoScreen: View {
    enum Field {
        case content
        case dateTime
    }
    @EnvironmentObject var themeManager: ThemeManager
    @EnvironmentObject var routeManager: RouteManager
    
    @ObservedObject var viewModel = CreateTodoViewModel()
    @FocusState var focusedField: Field?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add a task")
                .headline()
            Spacer()
                .frame(height: 30)
            HStack {
                Text("Content")
                    .medium()
                    .padding(.bottom, 5)
                    .frame(width: 100, alignment: .leading)
                Spacer()
                    .frame(width: 30)
                VStack {
                    TextField("Content", text: $viewModel.content)
                        .focused($focusedField, equals: .content)
                    Divider()
                        .frame(height: 1)
                }
            }
            Spacer()
                .frame(height: 30)
            HStack {
                Text(viewModel.isAllDay ? "Date": "Date / Time")
                    .medium()
                    .frame(width: 100, alignment: .leading)
                Spacer()
                    .frame(width: 30)
                HStack {
                    Text("~")
                        .font(.title)
                    DatePicker("", selection: $viewModel.targetDateTime, in: Date()..., displayedComponents: viewModel.isAllDay ? [.date]: [.date, .hourAndMinute])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                        .focused($focusedField, equals: .dateTime)
                        .clipped()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            Spacer()
                .frame(height: 30)
            HStack {
                Text("AllDay")
                    .medium()
                Spacer()
                    .frame(width: 30)
                HStack {
                    Toggle("", isOn: $viewModel.isAllDay)
                        .toggleStyle(ToggleCheckboxStyle())
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            Spacer()
                .frame(height: 50)
            Button {
                viewModel.add()
                routeManager.path.removeLast()
            } label: {
                Text("Done")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color(hex: 0x171717))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
            }
        }
        .frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding()
        .background(themeManager.selectedTheme.background)
        .onAppear {
            focusedField = .content
            UIApplication.shared.hideKeyboard()
        }
    }
}

#Preview {
    CreateTodoScreen()
}
