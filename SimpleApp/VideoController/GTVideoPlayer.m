//
//  GTVideoPlayer.m
//  SimpleApp
//
//  Created by Franky on 2019/8/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTVideoPlayer.h"
#import <AVKit/AVKit.h>

@interface GTVideoPlayer ()
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayerItem *playerItem;

@end

@implementation GTVideoPlayer

+ (instancetype)defaultPlayer{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView{
    [self _stopPlayer];
    
    NSURL *url = [NSURL URLWithString:videoUrl];
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
    self.playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:self.playerLayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didPlayToEndTime:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

}

- (void)_stopPlayer{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];

    [self.playerLayer removeFromSuperlayer];
    self.player = nil;
    self.playerItem = nil;
}

- (void)_didPlayToEndTime:(NSNotification *)sender{
    [self.player seekToTime:CMTimeMake(0, 1)];
    [self.player play];
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
        NSLog(@"缓冲进度%@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
