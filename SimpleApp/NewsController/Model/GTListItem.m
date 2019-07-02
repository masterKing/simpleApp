//
//  GTListItem.m
//  SimpleApp
//
//  Created by Franky on 2019/7/2.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)configWithDictionary:(NSDictionary *)dictionary{
#warning 类型是否匹配
    [self setValuesForKeysWithDictionary:dictionary];
}

@end
