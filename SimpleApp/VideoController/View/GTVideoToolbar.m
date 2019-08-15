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
    _avatroImageView.image = [UIImage imageNamed:@"icon"];
    _nickLabel.text = @"极客时间";
    
    _commentImageView.image = [UIImage imageNamed:@"comment"];
    _commentLabel.text = @"100";

    _likeImageView.image = [UIImage imageNamed:@"praise"];
    _likeLabel.text = @"25";

    _shareImageView.image = [UIImage imageNamed:@"share"];
    _shareLabel.text = @"分享";
    
    
    
    [NSLayoutConstraint activateConstraints:@[
                                              [NSLayoutConstraint constraintWithItem:_avatroImageView
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier:1.0
                                                                            constant:0.0],
                                              [NSLayoutConstraint constraintWithItem:_avatroImageView
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1.0
                                                                            constant:15],
                                              [NSLayoutConstraint constraintWithItem:_avatroImageView
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:30],
                                              [NSLayoutConstraint constraintWithItem:_avatroImageView
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:30],
                                              [NSLayoutConstraint constraintWithItem:_nickLabel
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:_avatroImageView
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier:1.0
                                                                            constant:0.0],
                                              [NSLayoutConstraint constraintWithItem:_nickLabel
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:_avatroImageView
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1.0
                                                                            constant:0],
                                              ]];
    
    NSString *vflString = @"H:|-15-[_avatroImageView]-0-[_nickLabel]-(>=0)-[_commentImageView(==_avatroImageView)]-0-[_commentLabel]-15-[_likeImageView(==_avatroImageView)]-0-[_likeLabel]-15-[_shareImageView(==_avatroImageView)]-0-[_shareLabel]-15-|";
    NSArray *a = [NSLayoutConstraint constraintsWithVisualFormat:vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatroImageView,_nickLabel,_commentImageView,_commentLabel,_likeImageView,_likeLabel,_shareImageView,_shareLabel)];
    [NSLayoutConstraint activateConstraints:a];
}

@end
