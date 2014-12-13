//
//  StartViewController.m
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 12/3/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //Background color
    self.view.backgroundColor = [UIColor whiteColor];
    //    PFUser *bro = [[PFUser alloc] init];
//    if (! [PFUser currentUser]){
//        
//    }
//    else{
//        NSLog(@"Am user");
//    }
//
    
    // Do any additional setup after loading the view.
    UIButton *login = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton * signup = [UIButton buttonWithType:UIButtonTypeSystem];
    [login setTitle:@"Login" forState:(UIControlStateNormal)];
    [login sizeToFit];

    [login addTarget:self action:@selector(buttonPressedLogin:) forControlEvents:UIControlEventTouchUpInside];

    login.center = CGPointMake(150, 250);
    
    [signup setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signup sizeToFit];
    [signup addTarget:self action:@selector(buttonPressedSignup:) forControlEvents:UIControlEventTouchUpInside];
    signup.center = CGPointMake(150, 150);
    
    [self.view addSubview:login];
    [self.view addSubview:signup];
}



- (void)buttonPressedLogin:(UIButton *)button{
    NSLog(@"I have been pressed");
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];

//    UIViewController *login = [[LoginUserViewController alloc] init];
//    [appDelegate.window setRootViewController:login];
    
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
    [appDelegate.window setRootViewController:tb];

}

-(void)buttonPressedSignup:(UIButton *)button{
    UIViewController * signup = [[SignInViewController alloc] init];
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate.window setRootViewController:signup];
//    [self.navigationController pushViewController:signup animated:YES];
}
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
