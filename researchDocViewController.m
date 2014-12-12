//
//  researchDoc.m
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 11/24/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

#import "researchDocViewController.h"

@interface researchDocViewController ()

@end

@implementation researchDocViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Entered here");
    self.view.backgroundColor = [UIColor whiteColor ];
    UILabel *alabel = [[UILabel alloc] init];
    
    alabel.center = CGPointMake(10, 300);
    alabel.textColor = [UIColor blackColor];
    alabel.text = [NSString stringWithFormat:@"Dude"];
    PFQuery *query = [PFQuery queryWithClassName:@"Research"];
    
    [query getObjectInBackgroundWithId:_objectId block:^(PFObject *object, NSError *error) {
//        self.title = [NSString stringWithFormat:@"%@",object[@"Title"]];
        self.title = @"Details";
        NSLog(@"The likes of this thing is %@",object[@"Likes"]);
    }];
    [self.view addSubview:alabel];
    
    
    UIScrollView *scrolling = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 300, self.view.bounds.size.width, self.view.bounds.size.height))];
    scrolling.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:scrolling];
//_objectId
    
}
-(void)setObjectId:(NSString *)objectId{
    _objectId = objectId;
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
