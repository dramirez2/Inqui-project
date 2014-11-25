//
//  ResearchViewViewController.m
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 11/24/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//
//Cellforrowatindexpath
//self es ResearchVIewController
#import "ResearchViewViewController.h"
#import "AppDelegate.h"
@interface ResearchViewViewController ()

@end

@implementation ResearchViewViewController

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"I was clicked at %@", indexPath);
//    UIViewController *researchDoc = [[UIViewController alloc] init];
//    UIApplication *delegateAssist = [[UIApplication sharedApplication] delegate];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
//    int n = indexPath.row;
//    indexPath.length;
    //Me quede tratando de unir un int al string
//    NSString ab = @"Research %d", 1;
//    cell.detailTextLabel.text = ab;
    
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Researches";
    //En los ultimos dos son width y height, primeros x, y
    UITableView *tbresearches = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width , self.view.bounds.size.height)];
    tbresearches.delegate = self;
    tbresearches.dataSource = self;
    //Esto dice que lo voy a usar en la tabla
   
    [self.view addSubview:tbresearches];
    
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