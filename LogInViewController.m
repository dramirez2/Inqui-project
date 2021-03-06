//
//  LogInViewController.m
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 11/25/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

#import "LogInViewController.h"
#import "AppDelegate.h"
#import "ResearchViewViewController.h"
#import "TopResearch.h"
#import "ProfileViewController.h"
#import "SettingsViewController.h"
#import <Parse/Parse.h>
@interface LogInViewController ()

@end

@implementation LogInViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //Create an app delegate instance
//    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
//    creates the button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    [button sizeToFit];
    // Set a new (x,y) point for the button's center
    button.center = CGPointMake(360/2, 70);
    
    // Add an action in current code file (i.e. target)
    [button addTarget:self action:@selector(buttonPressed:)
     
    forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
    
        //Test user sign in
        PFUser *user = [PFUser user];
        user.username = @"RandomUser";
        user.password = @"blah";
        user.email = @"example@gmail.com";
    
        // other fields can be set if you want to save more information
        //    user[@"phone"] = @"650-555-0000";
    
//        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (!error) {
//                // Hooray! Let them use the app now.
//    
//    
//            } else {
//                NSString *errorString = [error userInfo][@"error"];
//    
//                // Show the errorString somewhere and let the user try again.
//            }
//        }];


    
}
- (void)buttonPressed:(UIButton *)button {
//    NSLog(@"Button Pressed");
//  Creates an instance to the appDelegate
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    //Tab bar controller
    UITabBarController *tb = [[UITabBarController alloc] init];
    
    //Tab bar item declarations
    UITabBarItem *home = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    UITabBarItem *topResearch = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
    UITabBarItem *profile = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:2];
    UITabBarItem *settings = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:3];
    
    //Creates a table for the researches
    UIViewController *researchView = [[ResearchViewViewController alloc] init];
    UIViewController *topResearchView = [[TopResearch alloc] init];
    UIViewController *profileView = [[ProfileViewController alloc] init];
    UIViewController *settingsView = [[SettingsViewController alloc] init];
    
    //Navigation items
    UINavigationController *ncResearchView = [[UINavigationController alloc] initWithRootViewController:researchView];
    UINavigationController *ncTopResearchView = [[UINavigationController alloc] initWithRootViewController:topResearchView];
    UINavigationController *ncProfileView = [[UINavigationController alloc] initWithRootViewController:profileView];
    UINavigationController *ncSettings = [[UINavigationController alloc] initWithRootViewController:settingsView];
    
    //Sets the tab bar items to their view controllers
    researchView.tabBarItem = home;
    topResearchView.tabBarItem = topResearch;
    profileView.tabBarItem = profile;
    settingsView.tabBarItem = settings;
    
    //Array with the views of the tab bar
    tb.viewControllers = @[ncResearchView, ncTopResearchView, ncProfileView, ncSettings];
    
//    UIViewController *login = [[LogInViewController alloc] init];


    
//    [appDelegate.window setRootViewController:tb];
    
}

//- (IBAction)usernameText:(UITextField *)sender {
//    NSLog(@"It worked, the name thing");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
