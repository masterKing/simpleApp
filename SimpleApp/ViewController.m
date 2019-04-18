//
//  ViewController.m
//  SimpleApp
//
//  Created by Franky on 2019/4/18.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "ViewController.h"

@interface TestView : UIView

@end

@implementation TestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        NSLog(@"%s",__FUNCTION__);
    }
    return self;
}

//- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
//    [super willMoveToSuperview:newSuperview];
//    NSLog(@"%s",__FUNCTION__);
//}
//- (void)didMoveToSuperview{
//    [super didMoveToSuperview];
//    NSLog(@"%s",__FUNCTION__);
//}
//- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
//    [super willMoveToWindow:newWindow];
//    NSLog(@"%s",__FUNCTION__);
//}
//- (void)didMoveToWindow{
//    [super didMoveToWindow];
//    NSLog(@"%s",__FUNCTION__);
//}


@end

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%s",__FUNCTION__);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    TestView *aTestView = [[TestView alloc] init];
    aTestView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:aTestView];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapTestView)];
    [aTestView addGestureRecognizer:tapped];
}

- (void)didTapTestView{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    
}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
}

- (void)viewDidDisappear:(BOOL)animated{
    
}

- (void)viewWillLayoutSubviews NS_AVAILABLE_IOS(5_0){
    
}

- (void)viewDidLayoutSubviews NS_AVAILABLE_IOS(5_0){
    
}


@end
