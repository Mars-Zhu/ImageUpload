//
//  MaskView.swift
//  BlogUpload
//
//  Created by ZhuBicheng on 15/9/4.
//  Copyright (c) 2015年 当扈. All rights reserved.
//

import Cocoa

class MaskView: NSView {
    
    var progress:Float = 0.0
    
    override var flipped: Bool {
        get{
            return true
        }
    }

    func setProgressValue(progress:Float) {
        self.progress = progress
        setNeedsDisplayInRect(self.frame)
    }
    

    override func drawRect(dirtyRect: NSRect) {
        NSColor.greenColor().setFill()
        let frame = self.superview!.frame
        
        NSRectFill(NSMakeRect(0, 0, frame.width * CGFloat(progress), 10))
        
    }
    
    
    
}
