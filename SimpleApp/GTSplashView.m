
//
//  GTSplashView.m
//  SimpleApp
//
//  Created by Franky on 2019/9/27.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTSplashView.h"
#import "GTScreen.h"

@interface GTSplashView ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation GTSplashView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"LaunchImage-1200-Portrait-2688h@3x"];
        self.userInteractionEnabled = YES;
        self.button = [[UIButton alloc] initWithFrame:UIRectAdapter(330, 100, 60, 40)];
        self.button.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.button];
        [self.button setTitle:@"跳过" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(_didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)_didClickButton:(UIButton *)sender{
    [self removeFromSuperview];
}

@end
