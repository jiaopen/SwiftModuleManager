//
//  ModuleManager.swift
//  MobikeDriver
//
//  Created by 苏合 on 2018/1/30.
//  Copyright © 2018年 Suhe. All rights reserved.
//

import UIKit

extension String {
    
    func classFromString() -> AnyClass! {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        let cls: AnyClass = NSClassFromString("\(namespace).\(self)")!;
        return cls;
    }
}

class ModuleManager {
    
    static let shared = ModuleManager()
    
    private init() {}
    
    //module如果不属于当前的Bundle，则需要在plist文件里带上bundleName
    @discardableResult
    class func installModule(_ moduleName: String) -> Module? {
        
        var type: AnyClass?
        if moduleName.contains(".") {
            guard let tempType = NSClassFromString(moduleName) else {
                return nil
            }
            type = tempType
        } else {
            guard let tempType = moduleName.classFromString() else {
                return nil
            }
            type = tempType
        }
        
        guard type is Module.Type else {
            return nil
        }
        
        return installModule(type as! Module.Type)
    }
    
    @discardableResult
    class func installModule(_ type: Module.Type) -> Module? {
        if let exisitModule = shared.allModules[NSStringFromClass(type)] {
            return exisitModule
        }
        
        let module = type.load()
        shared.allModules[NSStringFromClass(type)] = module
        return module
    }
    
    class func installModules(fromPlist fileName: String) {
        let plistPath = Bundle.main.path(forResource: fileName, ofType: nil)!
        let moduleNames = NSArray(contentsOfFile: plistPath) as! [String]
        self.installModules(withNames: moduleNames)
    }
    
    class func installModules(withNames moduleNames: Array<String>) {
        for(_, moduleName) in (moduleNames.enumerated()){
            installModule(moduleName)
        }
    }
    
    class func module(_ moduleName: String) -> Module? {
        return shared.allModules[moduleName]
    }
    
    class func module<M>(_ type: M.Type) -> M? where M : Module{
        return shared.allModules[NSStringFromClass(type)] as? M
    }
    
    var allModules: [String : Module] = [:]
}

