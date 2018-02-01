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

    private init() {

    }
    
    @discardableResult
    func loadModule(_ moduleName: String) -> Module {
        let type = moduleName.classFromString() as! Module.Type
        let module = type.load()
        self.allModules.append(module)
        return module
    }
    
    class func loadModules(fromPlist fileName: String) {
        let plistPath = Bundle.main.path(forResource: fileName, ofType: nil)!

        let moduleNames = NSArray(contentsOfFile: plistPath) as! [String]
        
        for(_, moduleName) in (moduleNames.enumerated()){
            self.shared.loadModule(moduleName)
        }
    }
    
    var allModules: [Module] = []
}

