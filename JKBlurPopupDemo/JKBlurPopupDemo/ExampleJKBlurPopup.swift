//
//  ExamplePopup.swift
//  SwiftyPopup
//
//  Created by YoonTaesup on 2016. 4. 12..
//  Copyright © 2016년 YoonTaesup. All rights reserved.
//

import UIKit

class ExampleJKBlurPopup: JKBlurPopup {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 自定义宽高
        //setWidthHeight(400, 300)
        // 自定义圆角大小
        //setJKCorner(15)
        // 自定义背景模糊效果
        //setJKBlurEffect(.Light)
        
        let close = UIButton(type: .Custom)
        close.setTitle("点我关闭", forState: .Normal)
        close.setTitleColor(UIColor.greenColor(), forState: .Normal)
        close.frame = CGRectMake(0, 185, 300, 30)
        close.addTarget(self, action: #selector(btnClose), forControlEvents: .TouchUpInside)
        contentView.addSubview(close)
        
        
        
        print(contentView.frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func btnClose() {
        dismiss()
    }
}
