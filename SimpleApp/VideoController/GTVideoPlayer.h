//
//  GTVideoPlayer.h
//  SimpleApp
//
//  Created by Franky on 2019/8/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject

+ (instancetype)defaultPlayer;

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;

@end

NS_ASSUME_NONNULL_END

