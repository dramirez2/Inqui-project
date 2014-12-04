//
//  SignInViewController.h
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 12/3/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

#import "ViewController.h"
#import "StartViewController.h"
#import "LoginUserViewController.h"
#import <Parse/Parse.h>
@interface SignInViewController : ViewController <UITextFieldDelegate>

@property UITextField *usernameS;
@property UITextField *passwordS;
@property UITextField *emailS;

@end
