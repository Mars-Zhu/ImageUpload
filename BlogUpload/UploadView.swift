//
//  UploadView.swift
//  BlogUpload
//
//  Created by ZhuBicheng on 15/8/29.
//  Copyright (c) 2015年 当扈. All rights reserved.
//

import Cocoa
protocol UploadViewProtocol {
    func dragInto (path: String)
}

class UploadView: NSImageView {

    var delegate: UploadViewProtocol?
    
    var isHoveringFile:Bool = false
    
    override func drawRect(var dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        let color = NSColor(calibratedRed: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        let color2 = NSColor(calibratedRed: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        let color3 = NSColor(calibratedRed: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        let color4 = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0.025)
        let color5 = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0)
        
        let backgroud = NSBezierPath(rect: dirtyRect)
        isHoveringFile ? color4.setFill() : color5.setFill();
        backgroud.fill()
        
        dirtyRect = NSMakeRect(dirtyRect.origin.x + 5, dirtyRect.origin.y + 5, dirtyRect.size.width - 10, dirtyRect.size.height - 10)
        
        let rounderRectanglePath = NSBezierPath(roundedRect: dirtyRect, xRadius: 8, yRadius: 8)
        isHoveringFile ? color3.setFill() : color.setFill();
        rounderRectanglePath.lineWidth = 2.0
        var roundedRectanglePathern : [CGFloat] = [6.0,6.0,6.0,6.0];
        rounderRectanglePath.setLineDash(&roundedRectanglePathern, count: 4, phase: 0)
        rounderRectanglePath.stroke()

    }
    

    
    override func awakeFromNib() {
        registerForDraggedTypes([NSFilenamesPboardType])
    }
    
    override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        

//        Swift.print("\(__FUNCTION__)")

        
        return NSDragOperation.Copy
    }
    
    
    override func prepareForDragOperation(sender: NSDraggingInfo) -> Bool {
//        Swift.print("\(__FUNCTION__)")
        return true
    }
    
    override func performDragOperation(sender: NSDraggingInfo) -> Bool {
        Swift.print("\(__FUNCTION__)")
        
        let draggedFiles = sender.draggingPasteboard().propertyListForType(NSFilenamesPboardType) as! [String]
        for aString in draggedFiles {
            Swift.print(aString)
            delegate?.dragInto(aString)
        }
        
        return true
    }
    
    override func draggingExited(sender: NSDraggingInfo?) {
//        Swift.print("\(__FUNCTION__)")
    }
}
