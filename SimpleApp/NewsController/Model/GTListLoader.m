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
    // 首先读取缓存的数据
    NSArray<GTListItem *> *listData = [self _readDataFromLocal];
    if (listData) {
        block(YES, listData);
    }
    
    /* 再从网络请求
     */
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";

    NSURL *url = [NSURL URLWithString:urlString];

    NSURLRequest *listRequest = [NSURLRequest requestWithURL:url];

    NSURLSession *session = NSURLSession.sharedSession;

    __weak typeof(self) weakself = self;
    
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
        
        // 保存网络请求的数据到本地
        [weakself _archiveListDataWithArray:arrayM.copy];
        
        // 把数据给交给外部处理
        dispatch_async(dispatch_get_main_queue(), ^{
                       if (block) {
                           block(error == nil, arrayM.copy);
                       }
                   });
    }];

    [dataTask resume];
    
    /* 直接从本地异步加载
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 这里是在子线程,延时不会造成主线程UI的卡顿
        NSLog(@"%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:1.5];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ListData.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error = nil;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
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
    });
     */

    /*
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    */
    
    //[self _getSandBoxPath];
}


- (void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *cachePath = pathArray.lastObject;     NSLog(@"首页列表数据保存目录:%@",cachePath);
    
    NSFileManager *fileManager = NSFileManager.defaultManager;
    
    // 创建一个目录或者说文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *error = nil;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
    
    // 创建一个文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:data attributes:nil];
    
    // 查询文件是否存在
//    BOOL fileExists = [fileManager fileExistsAtPath:listDataPath];
    
    // 删除文件
//    if (fileExists) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    

    // 使用 NSFileHandle 追加数据
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"666" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
    
//    NSData *readData = [fileManager contentsAtPath:listDataPath];
//    id obj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readData error:nil];
//    NSLog(@"%@",obj);
}

- (NSArray<GTListItem *> *)_readDataFromLocal{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *cachePath = pathArray.lastObject;

    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];

    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    
    id obj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:data error:nil];
 
    if ([obj isKindOfClass:[NSArray class]] && [obj count] > 0) {
        return (NSArray<GTListItem *> *)obj;
    }
    
    return nil;
}

@end
