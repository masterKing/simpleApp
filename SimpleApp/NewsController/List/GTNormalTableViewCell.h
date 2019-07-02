//
//  GTNormalTableViewCell.h
//  SimpleApp
//
//  Created by Franky on 2019/5/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)cell didClickedDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell
- (void)layoutTableViewCell;

@property (nonatomic, weak) id<GTNormalTableViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
