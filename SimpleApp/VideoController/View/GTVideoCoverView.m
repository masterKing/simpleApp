//
//  GTVideoCoverView.m
//  SimpleApp
//
//  Created by Franky on 2019/7/19.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTVideoCoverView.h"
#import "GTVideoPlayer.h"

@interface GTVideoCoverView ()

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) UIImageView *playButton;

@property (nonatomic, strong) GTVideoToolbar *toolbar;

@property (nonatomic, copy) NSString *videoUrl;

@end

@implementation GTVideoCoverView

- (UIImageView *)playButton{
    if (_playButton == nil) {
        _playButton = [[UIImageView alloc] init];
        _playButton.image = [UIImage imageNamed:@"video"];
    }
    return _playButton;
}

- (UIImageView *)coverView{
    if (_coverView == nil) {
        _coverView = [[UIImageView alloc] init];
        _coverView.sd_imageIndicator = [SDWebImageProgressIndicator defaultIndicator];
    }
    return _coverView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.coverView];
        [self.coverView addSubview:self.playButton];
        
        self.coverView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height - GTVideoToolbarHeight);
        CGFloat w = 60;
        CGFloat h = w;
        CGFloat x = (frame.size.width - w) * 0.5;
        CGFloat y = (frame.size.height - h - GTVideoToolbarHeight) * 0.5;
        self.playButton.frame = CGRectMake(x, y, w, h);
        
        [self addSubview:({
            _toolbar = [[GTVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, _coverView.bounds.size.width, GTVideoToolbarHeight)];
            _toolbar;
        })];
        
        UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapped:)];
        [self addGestureRecognizer:tapped];
        
    }
    return self;
}

- (void)dealloc{
}

#pragma mark -
#pragma mark action

- (void)_tapped:(UITapGestureRecognizer *)sender{
    [[GTVideoPlayer defaultPlayer] playVideoWithUrl:self.videoUrl attachView:_coverView];
}


#pragma mark -
#pragma mark public method

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    self.videoUrl = videoUrl;
    
//    [_coverView sd_setImageWithURL:[NSURL URLWithString:videoCoverUrl] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
    
    [_coverView sd_setImageWithURL:[NSURL URLWithString:videoCoverUrl]];
    
    [_toolbar layoutWithModel:nil];
}


@end
