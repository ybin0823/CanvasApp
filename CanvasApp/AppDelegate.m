//
//  AppDelegate.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomeViewController.h"
#import "ListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[[UIWindow alloc]
                         initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    [window makeKeyAndVisible];
    [self setWindow:window];
    
    UITabBarController *tabBarController = [[[UITabBarController alloc] init] autorelease];
    
    HomeViewController *homeViewController = [[[HomeViewController alloc] init] autorelease];
    homeViewController.title = @"Home";
    homeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage imageNamed:@"ic_home_white.png"] selectedImage:nil];
    
    ListViewController *listViewController = [[[ListViewController alloc] init] autorelease];
    listViewController.title = @"List";
    listViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"List" image:[UIImage imageNamed:@"ic_list_white.png"] selectedImage:nil];
    
    UINavigationController *navigationController = [[[UINavigationController alloc] initWithRootViewController:homeViewController] autorelease];
    UINavigationController *theNavController2 = [[[UINavigationController alloc] initWithRootViewController:listViewController] autorelease];
    
    NSArray *controllers = [NSArray arrayWithObjects:navigationController,
                            theNavController2, nil];
    tabBarController.viewControllers = controllers;
    
    [[tabBarController tabBar] setTintColor:[UIColor colorWithRed:255 green:0 blue:255 alpha:0.5]];
    [[self window] setRootViewController:tabBarController];
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
