//
//  GTListItem.h
//  SimpleApp
//
//  Created by Franky on 2019/7/2.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTListItem : NSObject
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *thumbnail_pic_s;
@property (nonatomic, copy) NSString *uniquekey;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *author_name;
@property (nonatomic, copy) NSString *thumbnail_pic_s02;
@property (nonatomic, copy) NSString *url;

- (void)configWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END

