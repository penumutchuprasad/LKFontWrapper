//FileMngrVC.swift
/*
 * LKFontLibrary
 * Created by penumutchu.prasad@gmail.com on 03/12/18
 * Is a product created by abnboys
 * For the LKFontLibrary in the LKFontLibrary
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
 */

import UIKit

class FileMngrVC: UIViewController {
    
    let imgs = [#imageLiteral(resourceName: "becky"), #imageLiteral(resourceName: "tom"), #imageLiteral(resourceName: "finn"), #imageLiteral(resourceName: "holm")]
    var imgURLs = [URL]()
    var newimgs = [UIImage]()
    
    @IBOutlet var collView: UICollectionView!
    private let cellId = "ImgCell"
    
    var personsURL: URL!
    var humansURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collView.dataSource = self
        self.saveImagesToDisk()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        createAnotherFolder()
        scanTheDirectory(personsURL)
        print("^^^^^^^^^^^^^^^^^^^^^^")
        scanTheDirectory(humansURL)
    }
    
    func scanTheDirectory(_ folder: URL) {
        
        let enm = FileManager.default.enumerator(at: folder, includingPropertiesForKeys: nil)
        
        for url in enm! {
            print(url)
        }
    }
    
    //Create an other folder in the directory
    private func createAnotherFolder() {
        
        let newFolderURL = FileManager.documentDirectoryURL.appendingPathComponent("Humans")
        humansURL = newFolderURL
        if !FileManager.default.fileExists(atPath: newFolderURL.path) {
            do {
                try FileManager.default.createDirectory(at: newFolderURL, withIntermediateDirectories: true, attributes: nil)
                
            }
            catch let err {
                print(err.localizedDescription)
            }
        }
    }
    
    private func saveImagesToDisk() {
        
        //1. Access the Document Directory URL/Path
        let imgFolderURL = FileManager.documentDirectoryURL.appendingPathComponent("Persons")
        // init(fileURLWithPath: "Persons", relativeTo: FileManager.documentDirectoryURL)
        print(imgFolderURL.path as Any)
        personsURL = imgFolderURL
        if !FileManager.default.fileExists(atPath: imgFolderURL.path) {
            do {
                try FileManager.default.createDirectory(atPath: imgFolderURL.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                NSLog("Couldn't create document directory")
            }
        }
        
        for (indx, img) in imgs.enumerated() {
            
            if let imgData = img.jpegData(compressionQuality: 1.0) {
                let imgURL = imgFolderURL.appendingPathComponent("img\(indx)").appendingPathExtension("jpg")
                
                do {
                    try imgData.write(to: imgURL)
                    self.imgURLs.append(imgURL)
                }
                catch let err {
                    print(err.localizedDescription)
                }
            }
            
        }
        
    }
    
    private func loadImgsfromDisk() {
        
        for (indx, imgURL) in imgURLs.enumerated() {
            
            do {
                
                let imgData = try Data.init(contentsOf: imgURL)
                print(imgs[indx].jpegData(compressionQuality: 1.0) == imgData)
                let retrivedImg = UIImage.init(data: imgData)!
                newimgs.append(retrivedImg)
                
            }catch {
                print(error.localizedDescription)
            }
        }
        
        collView.reloadData()
    }
    
    @IBAction func onRetriveButtonClicl(_ sender: UIButton) {
        
        loadImgsfromDisk()
    }
    
    //Let's move images to & from persons folder to humans folder
    //This is a throwable, so use do catch...
    @IBAction func onMove(_ sender: UIButton) {
        
        if sender.tag == 0 {
            //Move to 2
            
            do {
                try FileManager.default.copyItem(at: imgURLs.first!, to: humansURL.appendingPathComponent("img0").appendingPathExtension("jpg"))
                try FileManager.default.removeItem(at: imgURLs.first!)
//                try FileManager.default.moveItem(atPath: imgURLs.first!.path, toPath: humansURL.path)
            }catch let err {
                print(err.localizedDescription)
            }
            
        } else {
            //Move to 1
            let imgURL = humansURL.appendingPathComponent("img0").appendingPathExtension("jpg")
            do {
                try FileManager.default.moveItem(at: imgURL, to: personsURL.appendingPathComponent("img0").appendingPathExtension("jpg"))
            }catch let err {
                print(err.localizedDescription)
            }
        }
        
    }
    
    
}

extension FileMngrVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newimgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImgCell
        cell.img = newimgs[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 125)
    }
}
