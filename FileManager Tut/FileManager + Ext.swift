//File.swift
/*
 * LKFontLibrary
 * Created by penumutchu.prasad@gmail.com on 01/12/18
 * Is a product created by abnboys
 * For the LKFontLibrary in the LKFontLibrary
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

extension FileManager {
    
    static var documentDirectoryURL: URL {
        let documentDirectoryURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentDirectoryURL
    }
    
}
