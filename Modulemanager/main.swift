//
//  main.swift
//  MobikeDriver
//
//  Created by 苏合 on 2018/1/30.
//  Copyright © 2018年 Mobike. All rights reserved.
//

import AppdelegateExtension

installAppDelegateExtensionsWithClass(AppDelegate.self)

UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)),
    NSStringFromClass(MYApplication.self),
    NSStringFromClass(AppDelegate.self)
)
