//
//  DoitWidget.swift
//  DoitWidget
//
//  Created by Juan Kim on 9/2/24.
//

import WidgetKit
import SwiftUI
import RealmSwift

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DoitWidgetEntryView : View {
    var entry: Provider.Entry
    
    @ObservedResults(
        Todo.self,
        configuration: RealmManager.config,
        sortDescriptor: SortDescriptor(keyPath: "isDone", ascending: true)
    ) var todos
    var sortedTodos: [Todo] {
        return todos.sorted { lhs, rhs in
            if lhs.isDone {
                return false
            } else {
                if lhs.isAllDay != rhs.isAllDay {
                    return true
                }
                return lhs.targetDateTime < rhs.targetDateTime
            }
        }
    }
    
    private var formatter: DateFormatter {
        let format = DateFormatter()
        format.dateFormat = "~ HH:mm"
        return format
    }
    
    var body: some View {
        VStack {
            ForEach(sortedTodos.prefix(3), id: \.self.id) { todo in
                HStack(alignment: .top) {
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5.0)
                                .inset(by: 2)
                                .stroke(Color(hex: 0xDADADA), lineWidth: 2)
                                .background(Color(hex: 0xFCFCFC))
                                .frame(width: 24, height: 24)
                            if todo.isDone {
                                Image("checkbox_checkmark")
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                        .frame(width: 10)
                    VStack(alignment: .leading) {
                        Text(todo.content)
                            .strikethrough(todo.isDone)
                            .foregroundStyle(Color(hex: 0x575767))
                            .bold()
                        Text(todo.isAllDay ? "all day" : formatter.string(from: todo.targetDateTime))
//                            .caption()
                            .foregroundStyle(Color(hex: 0xA3A3A3))
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 3)
                }
//                .todoRow()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white)
    }
}

struct DoitWidget: Widget {
    let kind: String = "DoitWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, provider: Provider()) { entry in
            DoitWidgetEntryView(entry: entry)
                .containerBackground(.white, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    DoitWidget()
} timeline: {
    SimpleEntry(date: .now)
    SimpleEntry(date: .now)
}
