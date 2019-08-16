//
//  main.m
//  SimpleApp
//
//  Created by Franky on 2019/4/18.
//  Copyright © 2019 Franky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"argc == %d,argv == %s",argc,*argv);
        return UIApplicationMain(argc, argv, @"MYApplication", NSStringFromClass([AppDelegate class]));
    }
}
