//
//  CreateTodoScreen.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import SwiftUI

struct CreateTodoScreen: View {
    @EnvironmentObject var themeManager: ThemeManager
    @EnvironmentObject var routeManager: RouteManager
    
    @ObservedObject var viewModel = CreateTodoViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add a task")
                .font(.system(size: 34).bold())
            Spacer()
                .frame(height: 30)
            HStack {
                Text("Content")
                    .font(.system(size: 20).bold())
                    .padding(.bottom, 5)
                Spacer()
                    .frame(width: 10)
                VStack {
                    TextField("Content", text: $viewModel.content)
                    Divider()
                        .frame(height: 1)
                }
            }
            Spacer()
                .frame(height: 30)
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
            UIApplication.shared.hideKeyboard()
        }
    }
}

#Preview {
    CreateTodoScreen()
}
