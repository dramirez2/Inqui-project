//
//  AppDelegate.m
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 11/24/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ResearchViewViewController.h"
#import "TopResearch.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

//Este es el primer metodo que se hace cuando la aplicacion corre
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //Esto siempre es lo mismo
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setWindow:_window];
    
    
    UITabBarController *tb = [[UITabBarController alloc] init];
   
                                              
    UITabBarItem *home = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    UITabBarItem *topResearch = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
    
    //Creates a table for the researches
    UIViewController *researchView = [[ResearchViewViewController alloc] init];
    UIViewController *topResearchView = [[TopResearch alloc] init];
    
    
    UINavigationController *ncResearchView = [[UINavigationController alloc] initWithRootViewController:researchView];
    UINavigationController *ncTopResearchView = [[UINavigationController alloc] initWithRootViewController:topResearchView];
    
    
    researchView.tabBarItem = home;
    topResearchView.tabBarItem = topResearch;
    
    //Tab bar
    //Array with the views of the tab bar
    tb.viewControllers = @[ncResearchView, ncTopResearchView];
    //El window va a ser ese que cree
    [self.window setRootViewController:tb];
    [self.window makeKeyAndVisible];
    
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
