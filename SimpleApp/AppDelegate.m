//
//  AppDelegate.m
//  SimpleApp
//
//  Created by Franky on 2019/4/18.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "WKWebViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <SDWebImage.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self registerAPN];
    
    // 将APP安装包内的版本号,记录到沙盒内
    NSString *versionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:versionString forKey:@"CFBundleShortVersionString"];
    
    GTNewsViewController *controller1 = [[GTNewsViewController alloc] init];
    
    GTVideoViewController *controller2 = [[GTVideoViewController alloc] init];
    
    GTRecommendViewController *controller3 = [[GTRecommendViewController alloc] init];
    
    WKWebViewController *mineViewController = [[WKWebViewController alloc] init];
    
    UITabBarController *aTabBarController = [[UITabBarController alloc] init];
    [aTabBarController setViewControllers:@[controller1,controller2,controller3,mineViewController]];
    aTabBarController.selectedIndex = 0;
    
    [[UIApplication sharedApplication] statusBarOrientationAnimationDuration];
    
    UINavigationController *aNavgationController = [[UINavigationController alloc] initWithRootViewController:aTabBarController];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = aNavgationController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"%s",__func__);
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    NSLog(@"%s",__func__);
//    [SDImageCache.sharedImageCache clearWithCacheType:SDImageCacheTypeAll completion:^{
//        NSLog(@"SDImageCacheTypeAll缓存清除成功");
//    }];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
#pragma mark 本地推送

// 注册通知
- (void)registerAPN {
    
    if (@available(iOS 10.0, *)) { // iOS10 以上
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        /*
         UNAuthorizationOptionBadge   = (1 << 0),
         UNAuthorizationOptionSound   = (1 << 1),
         UNAuthorizationOptionAlert   = (1 << 2),
*/
        [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
            NSLog(@"请求授权是否成功:%d",granted);
        }];
    } else {// iOS8.0 以上
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    }
}

@end
