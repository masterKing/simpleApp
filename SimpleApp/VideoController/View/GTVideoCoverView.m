//
//  GTVideoCoverView.m
//  SimpleApp
//
//  Created by Franky on 2019/7/19.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTVideoCoverView.h"
#import <AVKit/AVKit.h>

@interface GTVideoCoverView ()

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) UIImageView *playButton;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayerItem *playerItem;

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
        
        self.coverView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        CGFloat w = 60;
        CGFloat h = w;
        CGFloat x = (frame.size.width - w) * 0.5;
        CGFloat y = (frame.size.height - h) * 0.5;
        self.playButton.frame = CGRectMake(x, y, w, h);
        
        UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [self addGestureRecognizer:tapped];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didPlayToEndTime:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}

#pragma mark -
#pragma mark action

- (void)_didPlayToEndTime:(NSNotification *)sender{
//    [self.playerLayer removeFromSuperlayer];
//    self.player = nil;
//    self.playerItem = nil;
    
    [self.player seekToTime:CMTimeMake(0, 1)];
    [self.player play];
}

- (void)tapped:(UITapGestureRecognizer *)sender{
    
    NSURL *url = [NSURL URLWithString:self.videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL:url];
    
    self.playerItem = [AVPlayerItem playerItemWithAsset:asset];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1)
                                              queue:dispatch_get_main_queue()
                                         usingBlock:^(CMTime time) {
                                             NSLog(@"播放进度:------>%f",CMTimeGetSeconds(time));
                                         }];
    
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:self.playerLayer];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        if ([[change objectForKey:NSKeyValueChangeNewKey] integerValue] == AVPlayerItemStatusReadyToPlay) {
            [self.player play];
        }else{
            NSLog(@"播放失败");
        }
    }
    else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"%@",change);
    }
}

#pragma mark -
#pragma mark public method

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    self.videoUrl = videoUrl;
    
//    [_coverView sd_setImageWithURL:[NSURL URLWithString:videoCoverUrl] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
    
    [_coverView sd_setImageWithURL:[NSURL URLWithString:videoCoverUrl]];
}


@end
