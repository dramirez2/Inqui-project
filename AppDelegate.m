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
#import "researchDocViewController.h"
#import "ProfileViewController.h"
#import "SettingsViewController.h"
#import "LoginUserViewController.h"
#import "StartViewController.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

//Este es el primer metodo que se hace cuando la aplicacion corre
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //Connecting with Parse
    [Parse setApplicationId:@"divSVWHMZYoUGRBLFpOIUGpUCYeJYPoZUQuWdphT"
                  clientKey:@"I5h2WqlXZJgCJCL10EauF3plUANhSPdQrtkY4NTN"];
    //To track statistics
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
//    //Test user sign in
//    PFUser *user = [PFUser user];
//    user.username = @"RandomUser";
//    user.password = @"blah";
//    user.email = @"example@gmail.com";
//    
//    // other fields can be set if you want to save more information
//    //    user[@"phone"] = @"650-555-0000";
//    
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            // Hooray! Let them use the app now.
//            
//            
//        } else {
//            NSString *errorString = [error userInfo][@"error"];
//            
//            // Show the errorString somewhere and let the user try again.
//        }
//    }];

  
    
    //Esto siempre es lo mismo
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setWindow:_window];
    
    UIViewController *start = [[StartViewController alloc] init];
    UIViewController *ivan = [[UIViewController alloc] init];
    
//    UIViewController *login = [[LoginUserViewController alloc] init];
    [self.window setRootViewController:start];
    
    //    [self.window setRootViewController:tb];
//    [self.window setRootViewController:login];
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
