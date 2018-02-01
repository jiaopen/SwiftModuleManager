//
//  NotificationCenter+Helper.swift
//  MobikeDriver
//
//  Created by 苏合 on 2018/2/1.
//  Copyright © 2018年 Mobike. All rights reserved.
//

import Foundation

extension NotificationCenter {
    static func observeNotificationOnce(_ notificationName: NSNotification.Name, using block: @escaping (Notification) -> Swift.Void) {
        var observer: NSObjectProtocol?
        observer = NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: OperationQueue.main) { (note) in
            block(note)
            NotificationCenter.default.removeObserver(observer!)
        }
    }
}
