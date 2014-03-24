//
//  AppDelegate.m
//  JXDSegmentedControl
//
//  Created by JiangXiaodong on 3/24/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = rootViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
