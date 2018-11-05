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

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
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


}

