//
//  ViewController.swift
//  ExtandedView
//
//  Created by Admin on 2/4/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titelText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var hightOfImage: NSLayoutConstraint!
    @IBOutlet weak var weightOfImage: NSLayoutConstraint!
    @IBOutlet weak var distanceBetweenImageAndTitel: NSLayoutConstraint!
    @IBOutlet weak var titelFromTop: NSLayoutConstraint!
    
    
    fileprivate var viewIsExpanded: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5){
            
            self.hightOfImage.constant = self.viewIsExpanded == true ? 200 : 300
            self.weightOfImage.constant = self.viewIsExpanded == true ? 200 : 300
            
            self.distanceBetweenImageAndTitel.constant = self.viewIsExpanded == true ? 20 : 210
            //self.titelFromTop.constant = self.viewIsExpanded == true ? 15 : 15
        }
        viewIsExpanded = !viewIsExpanded    }
    
}

