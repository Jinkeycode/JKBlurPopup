//
//  ViewController.swift
//  SwiftyPopup
//
//  Created by YoonTaesup on 2016. 4. 12..
//  Copyright © 2016년 YoonTaesup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        imageView.image = UIImage(named: "JKBlurPopupDemoBG")
        let btn = UIButton(type: .Custom)
        btn.setTitle("戳我戳我", forState: .Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(imageView)
        self.view.addSubview(btn)
        
    }
    
    
    let popup = ExampleJKBlurPopup()
    func btnClick() {
        
        popup.showInView(self.view)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

