//SettingsHandler.swift
/*
 * LKFontLibrary
 * Created by penumutchu.prasad@gmail.com on 09/11/18
 * Is a product created by abnboys
 * For the LKFontLibrary in the LKFontLibrary
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class SettingsHandler {
    
    struct SettingsBundleKeys {
        
        static let name = "name_preference"
        static let font = "font_preference"
        static let reset = "reset_preference"
        static let version = "version_preference"
        static let build = "build_preference"
        static let color = "color_preference"

    }
    
    class func setVersionAndBuildNumber() {
        
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.set(version, forKey: SettingsBundleKeys.version)
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(build, forKey: SettingsBundleKeys.build)
    }
    
    class func resetTheAppData() {
        
        let isResetReq = UserDefaults.standard.bool(forKey: SettingsBundleKeys.reset)
        
        if isResetReq {
            print("APP's data reset successful")
        } else {
            print("APP's data reset unsuccessful")
        }
        
    }
   
}
