//
//  ViewController.m
//  SimpleApp
//
//  Created by Franky on 2019/4/18.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *aTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    aTableView.dataSource = self;
    aTableView.delegate = self;
    aTableView.rowHeight = 120;
    [self.view addSubview:aTableView];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNormalTableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
    if (aCell == nil) {
        aCell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCellID"];
    }
    [aCell layoutTableViewCell];
    
//    CGFloat red = arc4random_uniform(255) / 255.0;
//    CGFloat green = arc4random_uniform(255) / 255.0;
//    CGFloat blue = arc4random_uniform(255) / 255.0;
//    aCell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
//    aCell.textLabel.text = [NSString stringWithFormat:@"主标题 - %zd",indexPath.row];
//    aCell.detailTextLabel.text = @"副标题";
//    aCell.imageView.image = [UIImage imageNamed:@"video_selected"];
    return aCell;
}

#pragma mark -
#pragma mark UITableViewDelegate


@end
