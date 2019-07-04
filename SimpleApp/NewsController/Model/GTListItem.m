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


#pragma mark -
#pragma mark NSSecureCoding

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.category forKey:@"category"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.category = [aDecoder decodeObjectForKey:@"category"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

@end
