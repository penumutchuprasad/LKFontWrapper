//ImgCell.swift
/*
 * LKFontLibrary
 * Created by penumutchu.prasad@gmail.com on 04/12/18
 * Is a product created by abnboys
 * For the LKFontLibrary in the LKFontLibrary
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class ImgCell: UICollectionViewCell {
    
    
    var img: UIImage? {
        didSet{
            self.imgView.image = img
        }
    }
    
    @IBOutlet weak var imgView: UIImageView!
    
    
}
