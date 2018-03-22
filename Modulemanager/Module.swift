//
//  Module.swift
//  MobikeDriver
//
//  Created by 苏合 on 2018/1/30.
//  Copyright © 2018年 Suhe. All rights reserved.
//

import Foundation

public protocol Module: class {
    static func load() -> Module
    var name: String? {get}
    var version: String? {get}
}

extension Module {
    
    static var `default`: Self {
        get{
            let module = ModuleManager.module(Self.self)
            assert(module != nil, "Module has not been loaded yet.")
            return module!
        }
    }
}
