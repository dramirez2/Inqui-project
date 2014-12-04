//
//  LoginUserViewController.m
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 12/2/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

#import "LoginUserViewController.h"

@interface LoginUserViewController ()

@end

@implementation LoginUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *press = [UIButton buttonWithType:UIButtonTypeSystem];
    
    
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    [button sizeToFit];
    // Set a new (x,y) point for the button's center
    button.center = CGPointMake(150, 300);
    
    [press setTitle:@"Send info" forState:UIControlStateNormal];
    [press sizeToFit];
    press.center = CGPointMake(150, 350);
    
    // Add an action in current code file (i.e. target)
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [press addTarget:self action:@selector(anotherButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:button];
    [self.view addSubview:press];
    
    //Creating the tap gesture recognizer
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];

//    The parameters are X,Y,Width,Height
    UITextField *username = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, self.view.bounds.size.width - 20, 25)];
    UITextField *password = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, self.view.bounds.size.width - 20, 25)];
//    UITextField *email = [[UITextField alloc] initWithFrame:CGRectMake(10, 250, self.view.bounds.size.width - 20, 25)];
    
    [username setReturnKeyType:UIReturnKeyDone];
    [username setPlaceholder:@"Username"];
    [username setText:self._username.text];
    username.layer.borderWidth = 0.5;
    username.layer.borderColor = [[UIColor grayColor] CGColor];
    
    
    [password setReturnKeyType:UIReturnKeyDone];
    //Hide the characters
    password.secureTextEntry = YES;
    [password setPlaceholder:@"Password"];
    [password setText:self._password.text];
    password.layer.borderColor = [[UIColor grayColor] CGColor];
    password.layer.borderWidth = 0.5;
    
//    [email setReturnKeyType:UIReturnKeyDone];
//    //Change the keyboard style
//    [email setKeyboardType:UIKeyboardTypeEmailAddress];
//    [email setPlaceholder:@"Email"];
//    email.layer.borderColor = [[UIColor grayColor] CGColor];
//    email.layer.borderWidth = 0.5;
    
//    Makes them refer to themselves
    username.delegate = self;
    password.delegate = self;
//    email.delegate = self;

//    UIScrollView *windows = [[UIScrollView alloc] init];
    [self.view addSubview:username];
    [self.view addSubview:password];
//    [self.view addSubview:email];
    
    
    
}
-(void)dismissKeyboard {
    
    
    UITextField *usernam = [[UITextField alloc] init];
    usernam.text = self._username.text;
    NSLog(@"Tap recognized from %@",usernam.text);

    [usernam resignFirstResponder];
}
- (void)scrollRectToVisible:(CGRect)rect
                   animated:(BOOL)animated{
    
}
//- (BOOL)TapGestureRecognizer:(UITextField *) textField {
//    [textField resignFirstResponder];
//    NSLog(@"There was a tap");
//    return YES;
//}

-(void)setUsername:(UITextField *)username{
    __username = username;
}
-(void)setEmail:(UITextField *)email{
    __email = email;
}
-(void)setPassword:(UITextField *)password{
    __password = password;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    NSLog(@"Text from username %@",self._username.text);
//    self._username.text = textField.text;
    
    [self setUsername:textField];
    //You can do something with the string content, maybe set a property that holds the credentials
    NSLog(@"The key was returned %@",textField.text);
    return YES;
}


-(void)anotherButtonPressed:(UIButton *)press{
//    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    UIViewController *dude = [[ResearchViewViewController alloc] init];
    [self.navigationController pushViewController:dude animated:YES];
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
    

    [appDelegate.window setRootViewController:tb];
    
}

//- (IBAction)TestFile:(UITextField *)sender {
//    
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
