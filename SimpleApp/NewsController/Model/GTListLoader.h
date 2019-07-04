//
//  GTListLoader.h
//  SimpleApp
//
//  Created by Franky on 2019/7/2.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GTListItem;

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

NS_ASSUME_NONNULL_BEGIN

/**
 列表请求
 */
@interface GTListLoader : NSObject

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)block;

@end

NS_ASSUME_NONNULL_END
