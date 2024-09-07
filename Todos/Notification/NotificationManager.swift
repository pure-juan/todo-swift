//
//  NotificationManager.swift
//  Todos
//
//  Created by 찌오 on 9/7/24.
//

import Foundation
import UserNotifications


class NotificationManager {
    static let instance = NotificationManager()
    private init() {}
    
    func askPermission() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error ) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("acquire permission")
            }
        }
    }
    
    func schedule(notification: Notification) {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: notification.dateTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.subtitle = notification.subtitle
        content.sound = notification.sound
        
        let request = UNNotificationRequest(identifier: notification.id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancel(notificationId: Notification.ID) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationId.uuidString])
    }
    
    func cancelAll() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func clearBadge() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
}
