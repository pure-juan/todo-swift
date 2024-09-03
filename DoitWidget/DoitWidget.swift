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
        filter: NSPredicate(format: "isDone == false AND targetDateTime BETWEEN {%@, %@}", argumentArray: [Date().startOfDate(), Date().endOfDate()])
    ) var todos
    var sortedTodos: [Todo] {
        return todos.sorted { lhs, rhs in
            if lhs.isAllDay != rhs.isAllDay {
                return true
            }
            return lhs.targetDateTime < rhs.targetDateTime
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
                    Checkbox(isOn: todo.isDone)
                    Spacer()
                        .frame(width: 10)
                    VStack(alignment: .leading) {
                        Text(todo.content)
                            .font(.system(size: 16).bold())
                            .strikethrough(todo.isDone)
                            .foregroundStyle(Color(hex: 0x575767))
                            .bold()
                        Text(todo.isAllDay ? "all day" : formatter.string(from: todo.targetDateTime))
                            .font(.system(size: 12).bold())
                            .foregroundStyle(Color(hex: 0xA3A3A3))
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 3)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .overlay {
            if todos.isEmpty {
                VStack {
                    Text("No tasks")
                        .font(.system(size: 24).bold())
                    Text("so far so good!")
                        .font(.system(size: 14).bold())
                        .foregroundStyle(Color(hex: 0x737373))
                }
            }
        }
    }
}

struct DoitWidget: Widget {
    let kind: String = "DoitWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, provider: Provider()) { entry in
            DoitWidgetEntryView(entry: entry)
                .containerBackground(.white, for: .widget)
        }
        .supportedFamilies([.systemMedium])
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    DoitWidget()
} timeline: {
    SimpleEntry(date: .now)
    SimpleEntry(date: .now)
}
