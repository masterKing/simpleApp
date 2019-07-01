//
//  AppDelegate.m
//  SimpleApp
//
//  Created by Franky on 2019/4/18.
//  Copyright © 2019 Franky. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "WKWebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *controller1 = [[ViewController alloc] init];
    
    GTVideoViewController *controller2 = [[GTVideoViewController alloc] init];
    
    GTRecommendViewController *controller3 = [[GTRecommendViewController alloc] init];
    
    WKWebViewController *controller4 = [[WKWebViewController alloc] init];
    controller4.view.backgroundColor = [UIColor blueColor];
    controller4.tabBarItem.title = @"我的";
    controller4.tabBarItem.image = [UIImage imageNamed:@"home"];
    controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];
    
    UITabBarController *aTabBarController = [[UITabBarController alloc] init];
    [aTabBarController setViewControllers:@[controller1,controller2,controller3,controller4]];
    aTabBarController.selectedIndex = 0;
    
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
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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


@end
