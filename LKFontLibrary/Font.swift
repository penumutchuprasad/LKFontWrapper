//Font.swift
/*
 * LKFontLibrary
 * Created by penumutchu.prasad@gmail.com on 02/11/18
 * Is a product created by abnboys
 * For the LKFontLibrary in the LKFontLibrary
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

struct Font {
    
    enum FontType {
        
        case display
        case text
        case custom(String)
        
        func value() -> String {
            var newFont = ""
            
            switch self {
            case .display:
                newFont = "SFProDisplay-"
            case .text:
                newFont = "SFProText-"
            case .custom(let fontName):
                newFont = "\(fontName)-"
            }
            
            return newFont
        }
        
    }

    enum TraitType: String {
        
        case Regular
        case Medium
        case Bold
        case Semibold
        
        func trait() -> String {
            return rawValue
        }
        
    }
    
    enum FontSize {
        
        case standard
        case heading
        case custom(CGFloat)
        
        var value: CGFloat {
            switch self {
            case .standard:
                return 16.0
            case .heading:
                return 28.0
            case .custom(let customSize):
                return customSize
            }
        }
        
    }
    
    static func getFont(with type: FontType, withTrait trait: TraitType, ofSize size: FontSize = .standard) -> UIFont {
        
        var fontName: String
        
        switch type {
        case .text:
            fontName = "\(type.value())\(trait.rawValue)"
        case .display:
            fontName = "\(type.value())\(trait.rawValue)"
        default:
            fontName = "\(type.value())\(trait.rawValue)"
        }
        
        let arra = fontName.components(separatedBy: "-")
        let (fnt,style) = (arra.first!, arra.last!)
        if UIFont.familyNames.contains(fnt) {
            if !((UIFont.fontNames(forFamilyName: fnt)).contains(style)) {
                
                return UIFont.init(name: fnt, size: size.value)!
            }
        }
        
        return UIFont.init(name: fontName, size: size.value)!
        
    }
    
}


