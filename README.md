# JKBlurPopup
Create a popupview with blur background, using swift! I will add more animation to present the popupview constantly!
This is how the user interface looks like (from the demo app):

![](https://raw.githubusercontent.com/Jinkeycode/JKBlurPopup/master/JKBlurPopup.gif "JKBlurPopup.gif")

# Installation
`JKBlurPopup` is available through [CocoaPods](#). To install it, simply add the following line to your Podfile:
```pod "JKBlurPopup"`
In case you don’t want to use CocoaPods - just copy the file ** JKBlurPopup/JKBlurPopup.swift** to your Xcode project.

# Usage
To run the example project, clone the repo, and run pod install from the JKBlurPopupDemo directory first. That’ll run the demo program which shows you how the JKBlurPopup looks like and what it can do.

## Code samples
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
	    }
	    
	    
	    required init?(coder aDecoder: NSCoder) {
	        super.init(coder: aDecoder)
	    }
	    
	    func btnClose() {
	        dismiss()
	    }
	}

# Requirements
There aren’t any requirements per se. As long as you got UIKit imported the spinner takes care of everything else.

#  Thanks
This project is override from SwiftPopup, adding some API to custom the popupview’s size, shadow, blur background.
[https://github.com/ehowlsla/SwiftyPopup](https://github.com/ehowlsla/SwiftyPopup)
# License
`JKBlurPopup` is available under the MIT license. See the LICENSE file for more info.
