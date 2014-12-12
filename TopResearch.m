//
//  TopResearch.m
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 11/24/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

#import "TopResearch.h"

@interface TopResearch ()

@end

@implementation TopResearch

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *images = [[UIImageView alloc] initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, self.view.bounds.size.height/2)];    // Do any additional setup after loading the view.
//    images.self.backgroundColor = [UIColor redColor];
    [self.view addSubview:images];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,self.view.bounds.size.height/2, self.view.bounds.size.width, self.view.bounds.size.height/4)];
//    scroll.backgroundColor = [UIColor blueColor];
    scroll.delegate = self;
    
    self.title = @"Top research";
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = [UIColor blueColor];           
    
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
