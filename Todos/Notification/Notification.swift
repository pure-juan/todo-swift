//
//  Notification.swift
//  Todos
//
//  Created by 찌오 on 9/7/24.
//

import Foundation
import UserNotifications

struct Notification: Identifiable {
    var id: UUID
    var title: String
    var subtitle: String
    var sound: UNNotificationSound = .default
    var dateTime: Date
}
