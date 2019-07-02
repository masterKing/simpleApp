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

- (void)loadListData
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
        NSLog(@"%@",jsonObj);
        
        GTListItem *item = [[GTListItem alloc] init];
    
    }];

    [dataTask resume];
    
    NSLog(@"%@", url);
    
    
    
    
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

@end
