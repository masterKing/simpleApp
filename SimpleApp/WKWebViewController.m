//
//  WKWebViewController.m
//  SimpleApp
//
//  Created by Franky on 2019/4/22.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController ()

@end

@implementation WKWebViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor blueColor];
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"purchase" ofType:@"html" inDirectory:@"magazineHtml"];
//    NSURL *url = [NSURL fileURLWithPath:filePath];
//    NSURL *finalUrl = [NSURL URLWithString:@"#123" relativeToURL:url];
//    //[NSURL URLWithString:@"http://apphtml.fxeye.com/market?t=209003&u=1099612111&code="]
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:finalUrl];
//    [self.webView loadRequest:urlRequest];

    NSURL *url = [NSURL URLWithString:@"https://img.fxeye.com/test/attach/2018/05/636628525991159446/UMA636628525991159446_26067.pdf"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
