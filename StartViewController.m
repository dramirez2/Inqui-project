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
//    UIViewController *nclogin = [[UIViewController alloc]init];
//    UINavigationController *ncStart = [[UINavigationController alloc] initWithRootViewController:nclogin];
//    
//    [ncStart.navigationController pushViewController:nclogin animated:YES];
//    [self.navigationController pushViewController:login animated:YES];
    
    UIViewController *login = [[LoginUserViewController alloc] init];
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate.window setRootViewController:login];

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
