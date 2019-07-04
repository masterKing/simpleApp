//
//  GTListLoader.h
//  SimpleApp
//
//  Created by Franky on 2019/7/2.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;

typedef void(^abc)(BOOL success,NSArray<GTListItem *> *dataArray);

/**
 列表请求
 */
@interface GTListLoader : NSObject

- (void)loadListDataWithCompleteBlock:(abc)finishBlock;

@end

NS_ASSUME_NONNULL_END
