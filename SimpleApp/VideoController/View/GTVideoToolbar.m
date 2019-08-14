//
//  GTVideoToolbar.m
//  SimpleApp
//
//  Created by Franky on 2019/8/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTVideoToolbar.h"

@interface GTVideoToolbar ()
@property (nonatomic, strong) UIImageView *avatroImageView;
@property (nonatomic, strong) UILabel *nickLabel;
@property (nonatomic, strong) UIImageView *commentImageView;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UIImageView *likeImageView;
@property (nonatomic, strong) UILabel *likeLabel;
@property (nonatomic, strong) UIImageView *shareImageView;
@property (nonatomic, strong) UILabel *shareLabel;
@end

@implementation GTVideoToolbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:({
            _avatroImageView = [[UIImageView alloc] init];
            _avatroImageView.layer.masksToBounds = YES;
            _avatroImageView.layer.cornerRadius = 15;
            _avatroImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _avatroImageView;
        })];
        [self addSubview:({
            _nickLabel = [[UILabel alloc] init];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _nickLabel;
        })];
        
        [self addSubview:({
            _commentImageView = [[UIImageView alloc] init];
            _commentImageView.layer.masksToBounds = YES;
            _commentImageView.layer.cornerRadius = 15;
            _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _commentImageView;
        })];
        [self addSubview:({
            _commentLabel = [[UILabel alloc] init];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _commentLabel;
        })];

        [self addSubview:({
            _likeImageView = [[UIImageView alloc] init];
            _likeImageView.layer.masksToBounds = YES;
            _likeImageView.layer.cornerRadius = 15;
            _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _likeImageView;
        })];
        [self addSubview:({
            _likeLabel = [[UILabel alloc] init];
            _likeLabel.font = [UIFont systemFontOfSize:15];
            _likeLabel.textColor = [UIColor lightGrayColor];
            _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _likeLabel;
        })];

        [self addSubview:({
            _shareImageView = [[UIImageView alloc] init];
            _shareImageView.layer.masksToBounds = YES;
            _shareImageView.layer.cornerRadius = 15;
            _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _shareImageView;
        })];
        [self addSubview:({
            _shareLabel = [[UILabel alloc] init];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
        })];

    }
    return self;
}

- (void)layoutWithModel:(id)model{
    
}

@end
