//
//  GTVideoViewController.m
//  SimpleApp
//
//  Created by Franky on 2019/5/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTVideoViewController.h"
#import "GTVideoCoverView.h"

@interface GTVideoViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation GTVideoViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"video"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"video_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width / 16 * 9 + GTVideoToolbarHeight);
    
    UICollectionView *aCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [aCollectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"GTVideoCoverView"];
    aCollectionView.dataSource = self;
    aCollectionView.delegate = self;
    [self.view addSubview:aCollectionView];
    
    
}

#pragma mark -
#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GTVideoCoverView *aCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTVideoCoverView" forIndexPath:indexPath];
    
    aCell.backgroundColor = [UIColor redColor];
    [aCell layoutWithVideoCoverUrl:@"https://raw.githubusercontent.com/masterKing/markDownPictures/master/videoCover.png"
                          videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    
    return aCell;
}

#pragma mark -
#pragma mark UICollectionViewDelegate
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.item % 3 == 0) {
//        return CGSizeMake((self.view.frame.size.width), 100);
//    }else{
//        return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
//    }
//}

@end
