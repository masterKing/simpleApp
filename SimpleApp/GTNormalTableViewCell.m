//
//  GTNormalTableViewCell.m
//  SimpleApp
//
//  Created by Franky on 2019/5/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIButton *deleteButton;
@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 280, 50)];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor grayColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
//            self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 80, 50, 20)];
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor greenColor];
            self.rightImageView;
        })];

        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
            [self.deleteButton setTitle:@"x" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"v" forState:UIControlStateHighlighted];
            self.deleteButton.backgroundColor = [UIColor blueColor];
            [self.deleteButton addTarget:self
                                  action:@selector(didClickDeleteButton:)
                        forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton;
        })];
    }
    return self;
}

- (void)layoutTableViewCell{
    self.titleLabel.text = @"极客时间iOS开发";
    
    self.sourceLabel.text = @"极客时间";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"1888评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(CGRectGetMaxX(self.sourceLabel.frame) + 15, self.commentLabel.frame.origin.y, self.commentLabel.bounds.size.width, self.commentLabel.bounds.size.height);
    
    self.timeLabel.text = @"三分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(CGRectGetMaxX(self.commentLabel.frame) + 15, self.timeLabel.frame.origin.y, self.timeLabel.bounds.size.width, self.timeLabel.bounds.size.height);

    self.rightImageView.image = [UIImage imageNamed:@"timg.jpeg"];
}

- (void)didClickDeleteButton:(UIButton *)sender{
    NSLog(@"%s",__func__);
}

@end
