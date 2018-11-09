//ViewController.swift
/*
 * LKFontLibrary
 * Created by penumutchu.prasad@gmail.com on 02/11/18
 * Is a product created by abnboys
 * For the  in the LKFontLibrary
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class ViewController: UIViewController {
    lazy var lbl1 = createLabel()
    lazy var lbl2 = createLabel()
    lazy var lbl3 = createLabel()
    lazy var lbl4 = createLabel()
    lazy var lbl5 = createLabel()
    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fonts"
        
        let stack = UIStackView(arrangedSubviews: [lbl1, lbl2, lbl3, lbl4, lbl5])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillEqually
        view.addSubview(stack)
        view.addConstraints([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
            ])
        setFonts()
        
        //For Settings
        
        UserDefaults.standard.register(defaults: [String : Any]())

    }
    
    private func setFonts() {
        
        lbl1.font = UIFont.init(name: "Helvetica", size: 14)
        lbl2.font = Font.getFont(with: .custom("Helvetica"), withTrait: .Bold, ofSize: .custom(18))
        lbl3.font = Font.getFont(with: .display, withTrait: .Bold, ofSize: .custom(22))
        lbl4.font = Font.getFont(with: .text, withTrait: .Semibold, ofSize: .standard)
        lbl5.font = Font.getFont(with: .custom("Papyrus"), withTrait: .Regular, ofSize: .heading)
        
        nextButton.titleLabel?.font = Font.getFont(with: .custom("Papyrus"), withTrait: .Regular, ofSize: Font.FontSize.custom(18))
        
    }
    
    func createLabel() -> UILabel {
        let lbl  = UILabel()
        lbl.text = "welcome to swift programming"
        return lbl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        appThemeSetBySettingsPreference()
        appFontSetBySettingsPreference()
        printNameFromSettings()
        
        SettingsHandler.resetTheAppData()
        SettingsHandler.setVersionAndBuildNumber()
    }
    
    
    //MARK:- Settings Tutorial
    
    func appThemeSetBySettingsPreference() {
        
        let theme = UserDefaults.standard.string(forKey: SettingsHandler.SettingsBundleKeys.color)
        
        if theme == "black" {
            view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
    }
    
    func appFontSetBySettingsPreference() {
        
        let font = UserDefaults.standard.string(forKey: SettingsHandler.SettingsBundleKeys.font)
        
        if font == "Bold" {
            print("Header font selected")
        } else {
            print("Normal font selected")
        }
        
    }
    
    func printNameFromSettings() {
        
        if let name = UserDefaults.standard.string(forKey: SettingsHandler.SettingsBundleKeys.name) {
            
            print(name)
        }
        
    }
    
}

