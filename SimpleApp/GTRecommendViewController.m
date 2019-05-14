//
//  GTRecommendViewController.m
//  SimpleApp
//
//  Created by Franky on 2019/5/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController () <UIScrollViewDelegate>

@end

@implementation GTRecommendViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"like"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"like_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIScrollView *aScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    aScrollView.backgroundColor = [UIColor lightGrayColor];
    aScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    NSArray *colorArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor blueColor],[UIColor greenColor],[UIColor cyanColor],];
    for (NSInteger i = 0; i < 5; i++) {
        [aScrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(aScrollView.bounds.size.width * i, 0, aScrollView.bounds.size.width, aScrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    aScrollView.pagingEnabled = YES;
    aScrollView.delegate = self;
    [self.view addSubview:aScrollView];
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s",__func__);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}

@end
