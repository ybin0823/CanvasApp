//
//  AppDelegate.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[[UIWindow alloc]
                         initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    [window makeKeyAndVisible];
    [self setWindow:window];
    
    ViewController *viewController = [[[ViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    viewController.title = @"CanvasApp";
    
    UINavigationController *navigationController = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
    
    [[self window] setRootViewController:navigationController];
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
