//
//  ViewController.swift
//  How To Merge Two Images
//
//  Created by chander bhushan on 09/06/19.
//  Copyright © 2019 SwiftSeries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filter2: UIImageView!
    @IBOutlet weak var filter1: UIImageView!
    @IBOutlet weak var orginalImage: UIImageView!
    
    var orginalImageVar:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        orginalImageVar = orginalImage.image
    }

    
    func mergeTwoImage(originalImage:UIImage,filterImage:UIImage){
        
        let size = CGSize(width: originalImage.size.width, height: originalImage.size.height)
        UIGraphicsBeginImageContext(size)
        
        let area = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        originalImage.draw(in: area)
        filterImage.draw(in: area, blendMode: .normal, alpha: 1)
        
        var finalImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        orginalImage.image = finalImage
    }
    
    
    
    @IBAction func applyFilterOne(_ sender: Any) {
        mergeTwoImage(originalImage: orginalImageVar!, filterImage: filter1.image!)
    }
    

    @IBAction func applyFiltreTwo(_ sender: Any) {
        mergeTwoImage(originalImage: orginalImageVar!, filterImage: filter2.image!)
    }
}

