//
//  GTNewsViewController.m
//  SimpleApp
//
//  Created by Franky on 2019/4/18.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTNewsViewController.h"
#import "GTDetailViewController.h"

#import "GTNormalTableViewCell.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"

@interface GTNewsViewController () <UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) GTListLoader *listLoader;
@end

@implementation GTNewsViewController

#pragma mark -
#pragma mark system

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"page"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"page_selected"];

        _array = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            [_array addObject:@(i)];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any addition∫al setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UITableView *aTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    aTableView.dataSource = self;
    aTableView.delegate = self;
    aTableView.rowHeight = 120;
    [self.view addSubview:aTableView];
    self.tableView = aTableView;
    
    self.listLoader = [[GTListLoader alloc] init];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GTNormalTableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
    if (aCell == nil) {
        aCell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCellID"];
        aCell.delegate = self;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:({
        GTDetailViewController *vc = [[GTDetailViewController alloc] init];
        vc;
    }) animated:YES];
}

#pragma mark -
#pragma mark GTNormalTableViewCellDelegate

- (void)tableViewCell:(UITableViewCell *)cell didClickedDeleteButton:(UIButton *)deleteButton
{
    GTDeleteCellView *view = [[GTDeleteCellView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];

    CGRect rect = [cell convertRect:deleteButton.frame toView:nil];

    __weak typeof(self)weakself = self;

    [view showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(self) strongself = weakself;

        [strongself.array removeLastObject];

        [strongself.tableView deleteRowsAtIndexPaths:@[[strongself.tableView indexPathForCell:cell]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end
