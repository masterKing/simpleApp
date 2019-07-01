
//
//  GTDeleteCellView.m
//  SimpleApp
//
//  Created by Franky on 2019/6/30.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, copy) void (^aBlcokInProperty)(void);

@property (nonatomic, copy) dispatch_block_t deleteBlock;

@end

@implementation GTDeleteCellView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
            [_backgroundView addGestureRecognizer:tapped];
            _backgroundView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
            [_deleteButton addTarget:self action:@selector(didClickDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    
    }
    return self;
}

- (void)didClickDeleteButton:(UIButton *)sender{
    if (self.deleteBlock) {
        self.deleteBlock();
    }
    [self removeFromSuperview];
}

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock{
    
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    
    self.deleteBlock = clickBlock;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:[UIApplication sharedApplication].statusBarOrientationAnimationDuration
                          delay:0.f
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        
                         self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2.0, (self.bounds.size.height - 200)/2.0, 200, 200);
    
                     } completion:^(BOOL finished) {
        
                     }];
}

- (void)dismissDeleteView{
    [self removeFromSuperview];
}

- (void)tapped:(UITapGestureRecognizer *)sender{
    [self removeFromSuperview];
}

@end
