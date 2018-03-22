//
//  MBKApplication.swift
//  MobikeDriver
//
//  Created by 苏合 on 2018/1/30.
//  Copyright © 2018年 Mobike. All rights reserved.
//

import UIKit

class MYApplication: UIApplication {

    override init() {
        super.init()
        ModuleManager.installModules(fromPlist: "Modules.plist")
    }

}
