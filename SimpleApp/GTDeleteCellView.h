//
//  GTDeleteCellView.h
//  SimpleApp
//
//  Created by Franky on 2019/6/30.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;

- (void)dismissDeleteView;
@end

NS_ASSUME_NONNULL_END
