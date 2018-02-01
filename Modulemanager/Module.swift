//
//  Module.swift
//  MobikeDriver
//
//  Created by 苏合 on 2018/1/30.
//  Copyright © 2018年 Suhe. All rights reserved.
//

import Foundation

public protocol Module {
    static func load() -> Module
}

