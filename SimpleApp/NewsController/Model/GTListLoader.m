//
//  GTListLoader.m
//  SimpleApp
//
//  Created by Franky on 2019/7/2.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTListLoader.h"
#import <AFHTTPSessionManager.h>
#import "GTListItem.h"

@implementation GTListLoader

- (void)loadListDataWithCompleteBlock:(abc)finishBlock
{
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";

    /*
     */
    NSURL *url = [NSURL URLWithString:urlString];
 
    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = NSURLSession.sharedSession;
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError = nil;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSArray *dataArray = jsonObj[@"result"][@"data"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *info in dataArray) {
            GTListItem *item = [[GTListItem alloc] init];
            [item configWithDictionary:info];
            [arrayM addObject:item];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, arrayM.copy);
            }
        });
    }];

    [dataTask resume];
    
    
    
    
    /*
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    */
}

- (void)_archiveListDataWithArray:(NSArray *)array{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    // 创建文件
        
}

@end
