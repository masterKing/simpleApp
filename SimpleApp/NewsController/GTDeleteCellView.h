//
//  GTDeleteCellView.h
//  SimpleApp
//
//  Created by Franky on 2019/6/30.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 删除cell的时候展示的确认视图
 */
@interface GTDeleteCellView : UIView

/**
 点击出现删除cell的确认视图

 @param point 点击的位置
 @param clickBlock 点击后的操作
 */
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;

- (void)dismissDeleteView;
@end

NS_ASSUME_NONNULL_END
