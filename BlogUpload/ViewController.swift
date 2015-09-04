//
//  ViewController.swift
//  BlogUpload
//
//  Created by ZhuBicheng on 15/8/29.
//  Copyright (c) 2015年 当扈. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, UploadViewProtocol {

    @IBOutlet weak var uploadView: UploadView!
    
    @IBOutlet weak var textView: NSScrollView!
    
    @IBOutlet weak var maskView: MaskView!
    
    func dragInto(path: String) {
        self.textView.documentView?.setString(" ")
        let pathUrl = NSURL(fileURLWithPath: path)!
        let image = NSImage(contentsOfURL: pathUrl)
        uploadView.image = image
        
        let timestamp = NSDate().timeIntervalSince1970
        let tag = "\(pathUrl.lastPathComponent!)+\(timestamp)"
        let data = tag.dataUsingEncoding(NSUTF8StringEncoding)
        let base64String = data?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(0))
        
        PXUploadManager.uploadImage(image, imageName:base64String, finishBlock:{
            (bool success) -> Void in
            if success {
                self.textView.documentView?.setString("http://77g8qy.com1.z0.glb.clouddn.com/\(base64String!)")
            }
            }, progressBlock:{
                (Float progress) -> Void in
                self.maskView.setProgressValue(progress)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadView.delegate = self
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

