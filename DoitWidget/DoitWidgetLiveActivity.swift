//
//  DoitWidgetLiveActivity.swift
//  DoitWidget
//
//  Created by Juan Kim on 9/2/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DoitWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct DoitWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DoitWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension DoitWidgetAttributes {
    fileprivate static var preview: DoitWidgetAttributes {
        DoitWidgetAttributes(name: "World")
    }
}

extension DoitWidgetAttributes.ContentState {
    fileprivate static var smiley: DoitWidgetAttributes.ContentState {
        DoitWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: DoitWidgetAttributes.ContentState {
         DoitWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: DoitWidgetAttributes.preview) {
   DoitWidgetLiveActivity()
} contentStates: {
    DoitWidgetAttributes.ContentState.smiley
    DoitWidgetAttributes.ContentState.starEyes
}
