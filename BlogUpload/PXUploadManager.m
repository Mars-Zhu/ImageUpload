//
//  PXUploadManager.m
//  BlogUpload
//
//  Created by ZhuBicheng on 15/8/29.
//  Copyright (c) 2015年 当扈. All rights reserved.
//

#import "PXUploadManager.h"
#import <Qiniu/QiniuSDK.h>
#import "AFNetworking.h"
@implementation PXUploadManager

+ (void)uploadImage:(NSImage *)image imageName:(NSString *)imageName finishBlock:(void(^)(BOOL success))finishBlock progressBlock:(void(^)(float percent))progress{
    

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://192.241.204.17:1337" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *token = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        QNUploadManager *upManager = [[QNUploadManager alloc] init];
        QNUploadOption *opt = [[QNUploadOption alloc] initWithMime:@"image/png" progressHandler:^(NSString *key, float percent){
            progress(percent);
        }params:nil checkCrc:YES cancellationSignal:nil];
 
        NSData *data = [image TIFFRepresentation];
        [upManager putData:data key:imageName token:token
                  complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                      NSLog(@"%@", info);
                      NSLog(@"%@", resp);
                      finishBlock(YES);
                  } option:opt];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
 
}


+ (void)uploadImage:(NSImage *)image imageName:(NSString *)imageName finishBlock:(void(^)(BOOL success))finishBlock{
   
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://192.241.204.17:1337" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *token = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            QNUploadManager *upManager = [[QNUploadManager alloc] init];
            QNUploadOption *opt = [[QNUploadOption alloc] initWithMime:@"image/png" progressHandler:nil params:nil checkCrc:YES cancellationSignal:nil];
            NSData *data = [image TIFFRepresentation];
            [upManager putData:data key:imageName token:token
                      complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                          NSLog(@"%@", info);
                          NSLog(@"%@", resp);
                          finishBlock(YES);
                      } option:opt];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

@end
