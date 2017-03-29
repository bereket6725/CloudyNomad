//
//  ViewController.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/20/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gradientImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayBackground()
    }
    
    func displayBackground(){
        let randomNum = arc4random_uniform(UInt32(5)) + UInt32(1)
        let index = Int(randomNum)
        gradientImageView.image = UIImage(named:"gradient\(index).jpeg")
    }
    
    
}

