//
//  GTRecommendViewController.m
//  SimpleApp
//
//  Created by Franky on 2019/5/14.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "GTRecommendViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface GTRecommendViewController () <UIScrollViewDelegate,UIGestureRecognizerDelegate,UNUserNotificationCenterDelegate>

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
            
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor = [UIColor yellowColor];
                UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(tapped:)];
                tapped.delegate = self;
                [view addGestureRecognizer:tapped];
                view;
            })];
            
            
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    aScrollView.pagingEnabled = YES;
    aScrollView.delegate = self;
    [self.view addSubview:aScrollView];
    
}

- (void)tapped:(UITapGestureRecognizer *)sender{
    NSLog(@"%s",__func__);
    
    [self addLocalNotice];
    
}

- (void)addLocalNotice {
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        // 标题
        content.title = @"测试标题";
        content.subtitle = @"测试通知副标题";
        // 内容
        content.body = @"测试通知的具体内容";
        // 声音
        // 默认声音
        content.sound = [UNNotificationSound defaultSound];
        // 添加自定义声音
//        content.sound = [UNNotificationSound soundNamed:@"Alert_ActivityGoalAttained_Salient_Haptic.caf"];
        // 角标 （我这里测试的角标无效，暂时没找到原因）
        content.badge = @1;
        // 多少秒后发送,可以将固定的日期转化为时间
        NSTimeInterval time = [[NSDate dateWithTimeIntervalSinceNow:10] timeIntervalSinceNow];
        //        NSTimeInterval time = 10;
        // repeats，是否重复，如果重复的话时间必须大于60s，要不会报错
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:time repeats:NO];
         
        /*
         //如果想重复可以使用这个,按日期
         // 周一早上 8：00 上班
         NSDateComponents *components = [[NSDateComponents alloc] init];
         // 注意，weekday默认是从周日开始
         components.weekday = 2;
         components.hour = 8;
         UNCalendarNotificationTrigger *calendarTrigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
         */
        // 添加通知的标识符，可以用于移除，更新等操作
        NSString *identifier = @"noticeId";
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
        
        [center addNotificationRequest:request withCompletionHandler:^(NSError *_Nullable error) {
            NSLog(@"成功添加推送");
        }];
    }else {
        UILocalNotification *notif = [[UILocalNotification alloc] init];
        // 发出推送的日期
        notif.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        // 推送的内容
        notif.alertBody = @"你已经10秒没出现了";
        // 可以添加特定信息
        notif.userInfo = @{@"noticeId":@"00001"};
        // 角标
        notif.applicationIconBadgeNumber = 1;
        // 提示音
        notif.soundName = UILocalNotificationDefaultSoundName;
        // 每周循环提醒
        notif.repeatInterval = NSCalendarUnitWeekOfYear;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notif];
    }
}

#pragma mark -
#pragma mark UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
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

#pragma mark -
#pragma mark UNUserNotificationCenterDelegate

// The method will be called on the delegate only if the application is in the foreground. If the method is not implemented or the handler is not called in a timely manner then the notification will not be presented. The application can choose to have the notification presented as a sound, badge, alert and/or in the notification list. This decision should be based on whether the information in the notification is otherwise visible to the user.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler __IOS_AVAILABLE(10.0) __TVOS_AVAILABLE(10.0) __WATCHOS_AVAILABLE(3.0) __OSX_AVAILABLE(10.14){

    completionHandler(UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);
}

// The method will be called on the delegate when the user responded to the notification by opening the application, dismissing the notification or choosing a UNNotificationAction. The delegate must be set before the application returns from application:didFinishLaunchingWithOptions:.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler __IOS_AVAILABLE(10.0) __WATCHOS_AVAILABLE(3.0) __OSX_AVAILABLE(10.14) __TVOS_PROHIBITED{
    completionHandler();
}

// The method will be called on the delegate when the application is launched in response to the user's request to view in-app notification settings. Add UNAuthorizationOptionProvidesAppNotificationSettings as an option in requestAuthorizationWithOptions:completionHandler: to add a button to inline notification settings view and the notification settings view in Settings. The notification will be nil when opened from Settings.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(nullable UNNotification *)notification __IOS_AVAILABLE(12.0) __OSX_AVAILABLE(10.14) __WATCHOS_PROHIBITED __TVOS_PROHIBITED{
    
}

@end
