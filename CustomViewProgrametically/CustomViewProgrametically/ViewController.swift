//
//  ViewController.swift
//  CustomViewProgrametically
//
//  Created by Admin on 2/5/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var firstView = UIView()
    lazy var secondView = UIView()
    lazy var thirdView = UIView()
    lazy var forthView = UIView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView(){
        //print("a")
        firstView.frame = CGRect(x : 5, y : 5, width : CGFloat(view.frame.width)*0.6, height : CGFloat(view.frame.height)/3)
        firstView.backgroundColor = UIColor.red
        view.addSubview(firstView)
        
        secondView.frame = CGRect(x : CGFloat(firstView.frame.width)+10, y : 5, width : CGFloat(view.frame.width)*0.356, height : CGFloat(view.frame.height)*0.164)
        secondView.backgroundColor = UIColor.yellow
        view.addSubview(secondView)
        
        thirdView.frame = CGRect(x : CGFloat(firstView.frame.width)+10, y : CGFloat(secondView.frame.height)+10, width : CGFloat(view.frame.width)*0.356, height : CGFloat(view.frame.height)*0.164)
        thirdView.backgroundColor = UIColor.gray
        view.addSubview(thirdView)
        
        forthView.frame = CGRect(x : 5, y : CGFloat(firstView.frame.height)+10, width : CGFloat(view.frame.width)-10, height : CGFloat(view.frame.height)*0.66)
        forthView.backgroundColor = UIColor.lightGray
        view.addSubview(forthView)
        
    }


}

