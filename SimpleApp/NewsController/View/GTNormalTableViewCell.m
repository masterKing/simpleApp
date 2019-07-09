//
//  GTNormalTableViewCell.m
//  SimpleApp
//
//  Created by Franky on 2019/5/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"

@interface GTNormalTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIButton *deleteButton;
@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];

        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];

        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
//            self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];

        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];

        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor greenColor];
            self.rightImageView;
        })];

//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
//            [self.deleteButton setTitle:@"x" forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"v" forState:UIControlStateHighlighted];
//            self.deleteButton.backgroundColor = [UIColor blueColor];
//            [self.deleteButton addTarget:self
//                                  action:@selector(didClickDeleteButton:)
//                        forControlEvents:UIControlEventTouchUpInside];
//
//            self.deleteButton.layer.cornerRadius = 10;
//            self.deleteButton.layer.masksToBounds = YES;
//            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//            self.deleteButton.layer.borderWidth = 2;
//
//            self.deleteButton;
//        })];
    }
    return self;
}

- (void)layoutTableViewCellWithItem:(GTListItem *)item
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:item.uniquekey]) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }else{
        self.titleLabel.textColor = [UIColor blackColor];
    }
    
    self.titleLabel.text = item.title;

    self.sourceLabel.text = item.author_name;
    [self.sourceLabel sizeToFit];

    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(CGRectGetMaxX(self.sourceLabel.frame) + 15
                                         , self.commentLabel.frame.origin.y
                                         , self.commentLabel.bounds.size.width
                                         , self.commentLabel.bounds.size.height);

    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(CGRectGetMaxX(self.commentLabel.frame) + 15
                                      , self.timeLabel.frame.origin.y
                                      , self.timeLabel.bounds.size.width
                                      , self.timeLabel.bounds.size.height);

#warning
    
    /*
    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:item.thumbnail_pic_s]];
        self.rightImageView.image = [UIImage imageWithData:data];
    }];
    downloadImageThread.name = @"downloadImageThread";
    [downloadImageThread start];
     */
    
    /*
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:item.thumbnail_pic_s]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.rightImageView.image = [UIImage imageWithData:data];
        });
    });
     */
    
    /*
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:item.thumbnail_pic_s]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.rightImageView.image = [UIImage imageWithData:data];
        }];
    }];
    [queue addOperation:op];
     */
    
//    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnail_pic_s] completed:nil];
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnail_pic_s]
                           placeholderImage:[UIImage imageNamed:@"video_selected"]
                                    options:SDWebImageAllowInvalidSSLCertificates
                                    context:nil
                                   progress:nil
                                  completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                      
                                      NSLog(@"%zd",cacheType);
                                     
                                  }];
}

- (void)didClickDeleteButton:(UIButton *)sender
{
    NSLog(@"%s", __func__);

    if ([self.delegate respondsToSelector:@selector(tableViewCell:didClickedDeleteButton:)]) {
        [self.delegate tableViewCell:self didClickedDeleteButton:sender];
    }
}

@end
