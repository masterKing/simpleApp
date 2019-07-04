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

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)block
{
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";

    NSURL *url = [NSURL URLWithString:urlString];

    NSURLRequest *listRequest = [NSURLRequest requestWithURL:url];

    NSURLSession *session = NSURLSession.sharedSession;

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:listRequest completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        NSError *jsonError = nil;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

#warning 需要做类型的检查
        NSArray *dataArray = jsonObj[@"result"][@"data"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *info in dataArray) {
            GTListItem *item = [[GTListItem alloc] init];
            [item configWithDictionary:info];
            [arrayM addObject:item];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
                       if (block) {
                           block(error == nil, arrayM.copy);
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
    
    [self _getSandBoxPath];
}


- (void)_getSandBoxPath{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *cachePath = pathArray.lastObject; NSLog(@"%@",cachePath);
    
    NSFileManager *fileManager = NSFileManager.defaultManager;
    
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    
    // 创建一个目录或者说文件夹
    NSError *error = nil;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
    
    // 创建一个文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *data = [@"金文" dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager createFileAtPath:listDataPath contents:data attributes:nil];
    
    // 查询文件是否存在
    BOOL fileExists =  [fileManager fileExistsAtPath:listDataPath];
    
    // 删除文件
//    if (fileExists) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    

    // 使用 NSFileHandle
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[@"666" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle synchronizeFile];
    [fileHandle closeFile];
    
}

@end
