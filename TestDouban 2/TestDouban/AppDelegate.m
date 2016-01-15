//
//  AppDelegate.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "AppDelegate.h"
#import "ActivityViewController.h"
#import "MovieViewController.h"
#import "CinemaViewController.h"
#import "SavenessViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    
    ActivityViewController *avc = [[ActivityViewController alloc] init];
    MovieViewController *mvc = [[MovieViewController alloc] init];
    CinemaViewController *cvc = [[CinemaViewController alloc] init];
    SavenessViewController *svc = [[SavenessViewController alloc] init];
    
    UINavigationController *nvc1 = [[UINavigationController alloc] initWithRootViewController:avc];
    UINavigationController *nvc2 = [[UINavigationController alloc] initWithRootViewController:mvc];
    UINavigationController *nvc3 = [[UINavigationController alloc] initWithRootViewController:cvc];
    UINavigationController *nvc4 = [[UINavigationController alloc] initWithRootViewController:svc];
    
    
    nvc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"活动" image:[UIImage imageNamed:@"activity.png"] tag:101];
    nvc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"电影" image:[UIImage imageNamed:@"movie.png"] tag:102];
    nvc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"影院" image:[UIImage imageNamed:@"cinema.png"] tag:103];
    nvc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"user.png"] tag:104];
    
    
    tab.viewControllers = @[nvc1,nvc2,nvc3,nvc4];
    
    self.window.rootViewController = tab;
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
