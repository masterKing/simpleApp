//
//  GTVideoCoverView.h
//  SimpleApp
//
//  Created by Franky on 2019/7/19.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTVideoToolbar.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
