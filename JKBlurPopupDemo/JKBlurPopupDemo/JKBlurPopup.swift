//
//  JKBlurPopup.swift
//  JKBlurPopup
//
//  Created by Jinkey on 2016. 4. 12..
//  Copyright ©2016 Jinkey. All rights reserved.
//


import UIKit


class JKBlurPopup: UIView {
    
    var attached = false
    let contentView = UIView()
    
    
    var _w = CGFloat(300)
    var _h = CGFloat(400)
    
    var target: UIView?
    var corner = CGFloat(5)
    
    let dummyStart = CGFloat(32)
    
    var blurEffectView = UIVisualEffectView()
    var blurEffect = UIBlurEffectStyle.Light
    
    
    override init(frame: CGRect) {
        
        
        super.init(frame: frame)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func showInView(target: UIView) {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardHide), name: UIKeyboardWillHideNotification, object: nil)
        
        self.frame = target.frame
        let btnHide = UIButton(type: .Custom)
        btnHide.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        btnHide.addTarget(self, action: #selector(hideKeyboardDismiss), forControlEvents: .TouchUpInside)
        self.addSubview(btnHide)
        
        self.target = target
        self.contentView.frame =  CGRectMake(0, 0, target.frame.width, target.frame.height)
        for subview in self.contentView.subviews {
            subview.alpha = 0
        }
        

        print(self.corner)
        self.alpha = 0
        self.contentView.alpha = 0
        self.contentView.clipsToBounds = true
        // 设置阴影
        self.layer.shadowOffset = CGSizeMake(3, 3);
        self.layer.shadowRadius = 5.0;
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.3
        
        
        self.contentView.backgroundColor = UIColor.whiteColor()
         
        self.addSubview(contentView)
        
        blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: self.blurEffect))
        blurEffectView.frame = self.bounds
        
        target.addSubview(blurEffectView)
        target.addSubview(self)
        
        UIView.animateWithDuration(0.15, animations: {
            self.alpha = 1
            self.contentView.alpha = 1
            self.contentView.frame = CGRectMake((target.frame.width - self._w) / 2, (target.frame.height - self._h) / 2 - self.dummyStart, self._w, self._h)
            
            }, completion: { complete in
                self.contentView.layer.cornerRadius = self.corner
                UIView.animateWithDuration(0.05, animations: {
                    for subview in self.contentView.subviews {
                        subview.alpha = 1
                    }
                })
        })
        
        self.attached = true
    }
    
    func dismiss() {
        self.attached = false
        if let target = self.target {
            UIView.animateWithDuration(0.05, animations: {
                for subview in self.contentView.subviews {
                    subview.alpha = 0
                }
                self.contentView.alpha = 0.5
                }, completion: { complete in
                    UIView.animateWithDuration(0.15, animations: {
                        self.contentView.frame = target.frame
                        self.alpha = 0
                        self.blurEffectView.removeFromSuperview()
                        }, completion: { complete in
                            self.removeFromSuperview()
                    })
            })
            
            
        } else {
            self.removeFromSuperview()
        }
    }
    
    func setWidthHeight(width: CGFloat, _ height: CGFloat) {
        self._w = width
        self._h = height
    }
    
    func setJKCorner(corner: CGFloat) {
        self.corner = corner
    }
    
    func setJKBlurEffect(blurEffect: UIBlurEffectStyle) {
        self.blurEffect = blurEffect
    }
    
    func hideKeyboardDismiss() {
        for v in self.contentView.subviews {
            if(v.isKindOfClass(UITextField) || v.isKindOfClass(UITextView)) {
                v.resignFirstResponder()
            }
        }
        dismiss()
    }
    
    func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            let y = (self.frame.height - keyboardSize.height - self.contentView.frame.height) / 2 + 42 - dummyStart
            if self.contentView.frame.minY > y {
                UIView.animateWithDuration(0.2, animations: {
                    self.contentView.frame = CGRectMake(self.contentView.frame.minX, (self.frame.height - keyboardSize.height - self.contentView.frame.height) / 2 + 42 - self.dummyStart, self.contentView.frame.width, self.contentView.frame.height)
                })
            }
        }
    }
    
    func keyboardHide(notification: NSNotification) {
        if let target = self.target {
            UIView.animateWithDuration(0.2, animations: {
                self.contentView.frame = CGRectMake((target.frame.width - self._w) / 2, (target.frame.height - self._h) / 2 - self.dummyStart, self._w, self._h)
            })
        }
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
}
