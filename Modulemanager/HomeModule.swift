//
//  HomeModule.swift
//  MobikeDriver
//
//  Created by 苏合 on 2018/2/1.
//  Copyright © 2018年 Mobike. All rights reserved.
//

import UIKit

class HomeModule: Module {
    
    var name: String?
    
    var version: String?
    
    static func load() -> Module {
        return HomeModule()
    }
    
    private init() {
        NotificationCenter.observeNotificationOnce(NSNotification.Name.UIApplicationDidFinishLaunching) { (notification) in
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.backgroundColor = UIColor.white
            let homeViewController = ViewController()
            let navigationController = UINavigationController(rootViewController: homeViewController)
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
    }
    
    var window: UIWindow?
}
