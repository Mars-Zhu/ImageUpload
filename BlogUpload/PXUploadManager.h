//
//  PXUploadManager.h
//  BlogUpload
//
//  Created by ZhuBicheng on 15/8/29.
//  Copyright (c) 2015年 当扈. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface PXUploadManager : NSObject

+ (void)uploadImage:(NSImage *)image imageName:(NSString *)imageName finishBlock:(void(^)(BOOL success))finishBlock;

@end
