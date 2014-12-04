//
//  SignInViewController.m
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 12/3/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    
    [button setTitle:@"Sign Up" forState:UIControlStateNormal];
    [button sizeToFit];
    // Set a new (x,y) point for the button's center
    button.center = CGPointMake(150, 250);
    
    
    // Add an action in current code file (i.e. target)
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:button];
    
    //Creating the tap gesture recognizer
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//    [self.view addGestureRecognizer:tap];
    
    //    The parameters are X,Y,Width,Height
    UITextField *username = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width - 20, 25)];
    UITextField *password = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, self.view.bounds.size.width - 20, 25)];
    UITextField *email = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, self.view.bounds.size.width - 20, 25)];
    
    [username setReturnKeyType:UIReturnKeyDone];
    [username setPlaceholder:@"Username"];
    username.layer.borderWidth = 0.5;
    username.layer.borderColor = [[UIColor grayColor] CGColor];
    username.tag = 0;
    
    [password setReturnKeyType:UIReturnKeyDone];
    //Hide the characters
    password.secureTextEntry = YES;
    [password setPlaceholder:@"Password"];
    password.layer.borderColor = [[UIColor grayColor] CGColor];
    password.layer.borderWidth = 0.5;
    password.tag =1;
    
    [email setReturnKeyType:UIReturnKeyDone];
    //Change the keyboard style
    [email setKeyboardType:UIKeyboardTypeEmailAddress];
    [email setPlaceholder:@"Email"];
    email.layer.borderColor = [[UIColor grayColor] CGColor];
    email.layer.borderWidth = 0.5;
    email.tag = 2;
    
    //    Makes them refer to themselves
    username.delegate = self;
    password.delegate = self;
    email.delegate = self;
    
    //    UIScrollView *windows = [[UIScrollView alloc] init];
    [self.view addSubview:username];
    [self.view addSubview:password];
    [self.view addSubview:email];
    
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    //This function is needed to change the values as they are being placed
    
    if (textField.tag == 0) {
        self.usernameS = textField;
        
    } else if (textField.tag == 1){
        self.passwordS = textField;
        
    } else if(textField.tag == 2){
        self.emailS = textField;
    }

}
//-(void)textFieldDidEndEditing:(UITextField *)textField
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    //If else statement that checks if the textfield is the corresponding one
    
    //You can do something with the string content, maybe set a property that holds the credentials
    NSLog(@"The key was returned %@",self.passwordS.text);
    return YES;
}



- (void)buttonPressed:(UIButton *)button {
    
    PFUser *user = [PFUser user];
    user.username = self.usernameS.text;
    user.password = self.passwordS.text;
    user.email = self.emailS.text;
    
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            if (self.passwordS != nil && self.usernameS != nil && self.emailS != nil ){
                AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
                
                //Creates the
                LoginUserViewController *login = [[LoginUserViewController alloc] init];
                
                login._username = self.usernameS;
                login._email = self.emailS;
                login._password = self.passwordS;
                
                [appDelegate.window setRootViewController:login];
                
            }

        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"There was an error %@",errorString);
            // Show the errorString somewhere and let the user try again.
        }
    }];

        //    NSLog(@"Button Pressed");
    
    //  Creates an instance to the appDelegate
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
