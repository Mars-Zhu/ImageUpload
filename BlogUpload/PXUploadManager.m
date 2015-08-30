//
//  PXUploadManager.m
//  BlogUpload
//
//  Created by ZhuBicheng on 15/8/29.
//  Copyright (c) 2015年 当扈. All rights reserved.
//

#import "PXUploadManager.h"
#import <Qiniu/QiniuSDK.h>

@implementation PXUploadManager

+ (void)uploadImage:(NSImage *)image imageName:(NSString *)imageName finishBlock:(void(^)(BOOL success))finishBlock{
    
    NSString *token = @"NoYZIBcfe9UvJEUvI43CBrWILPH3bdmuimSBh14Q:6CCiXxmtg5Ur_wDn-HV70hdUYe8=:eyJzY29wZSI6InB4YmxvZyIsImRlYWRsaW5lIjoxNDQwOTAxOTAwfQ==";
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
//    QNUploadOption *opt = [[QNUploadOption alloc] initWithMime:@"image/png" progressHandler:nil params:nil } checkCrc:YES cancellationSignal:nil];
    NSData *data = [image TIFFRepresentation];
    [upManager putData:data key:imageName token:token
              complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                  NSLog(@"%@", info);
                  NSLog(@"%@", resp);
                  finishBlock(YES);
              } option:nil];
}

@end
