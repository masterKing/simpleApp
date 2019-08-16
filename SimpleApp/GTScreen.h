//
//  GTScreen.h
//  SimpleApp
//
//  Created by Franky on 2019/8/15.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static inline NSInteger UIAdapter (float x) {
    CGFloat scale = 414.0 / MIN(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    return (NSInteger)x / scale;
}

static inline CGRect UIRectAdapter(x,y,width,height) {
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

@interface GTScreen : NSObject

@end

NS_ASSUME_NONNULL_END
