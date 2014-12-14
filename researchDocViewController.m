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
    self.title = @"Details";
    self.view.backgroundColor = [UIColor whiteColor ];
    //IVAN, ESTE LABEL ES LO QUE APARECE EN EL SCROLL VIEW, SE PONE EN EL VIEW
    UILabel *alabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, 100))];
    
    alabel.textColor = [UIColor blackColor];
    alabel.text = @"Testing man this shit is bananas \r b-a-n-a-n-a-s uhu this my shit! \r a new \r another";
    alabel.numberOfLines = self.view.bounds.size.height;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Research"];
    
    [query getObjectInBackgroundWithId:_objectId block:^(PFObject *object, NSError *error) {
//        self.title = [NSString stringWithFormat:@"%@",object[@"Title"]];
        NSLog(@"The likes of this thing is %@",object[@"Likes"]);
    }];
    //IVAN, AQUI ESTA EL VIEW DONDE LE A~ADES EL LABEL, Y ESTE VIEW LO A~ADES AL SCROLLVIEW
    UIView *testing = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))];
    //EL ACTO DE PONER EL LABEL EN EL VIEW
    [testing addSubview:alabel];
    testing.backgroundColor = [UIColor whiteColor];
    
    //ESTE ES EL SCROLLVIEW COMO TAL
    UIScrollView *scrolling = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height))];
    scrolling.scrollEnabled = YES;
    scrolling.showsVerticalScrollIndicator = YES;
    
//    scrolling.backgroundColor = [UIColor redColor];
    //EL ACTO DE PONER EL VIEW EN EL SCROLLVIEW
    [scrolling addSubview:testing];
    scrolling.contentSize = testing.frame.size;
    
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
