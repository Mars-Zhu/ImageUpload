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
    
    
    func dragInto(path: String) {
//        print(path)
        let pathUrl = NSURL(fileURLWithPath: path)!
        let image = NSImage(contentsOfURL: pathUrl)
        uploadView.image = image
        PXUploadManager.uploadImage(image, imageName: pathUrl.lastPathComponent! ){
            (bool success) -> Void in
            if success {
                self.textView.documentView?.setString("http://77g8qy.com1.z0.glb.clouddn.com/\(pathUrl.lastPathComponent!)")
            }
        };
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

