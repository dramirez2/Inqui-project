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
#import <Parse/Parse.h>
@interface ResearchViewViewController ()

@end

@implementation ResearchViewViewController


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"I was clicked at %@", indexPath);

    UIViewController *researchDoc = [[UIViewController alloc] init];
//    
//    PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
//    gameScore[@"score"] = @20112;
//    gameScore[@"playerName"] = @"Daniel";
//    gameScore[@"cheatMode"] = @NO;
//    [gameScore saveInBackground];
//    
//    PFObject *researches = [PFObject objectWithClassName:@"researchProyect"];
//    researches[@"poster"] =@"";
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
//    [query getObjectInBackgroundWithId:@"oxIwX8ZWsx" block:^(PFObject *gameScore, NSError *error) {
//        // Do something with the returned PFObject in the gameScore variable.
//        NSLog(@"%@", gameScore);
//    }];
    
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    [query whereKey:@"playerName" equalTo:@"Daniel"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    //Sends the view to the researchDoc
    [self.navigationController pushViewController:researchDoc animated:YES];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    PFQuery *researchesQ = [PFQuery queryWithClassName:@"TestObject"];
    
    [researchesQ countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
        if (!error) {
            NSLog(@"There are %d many queries",number);
        } else {
            NSLog(@"Something went bad");
        }
    }];
//    researchesQ.countObjects;
    
//    NSLog(@"%ld",(long) researchesQ.countObjects);
        return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
//  For test purposes, here is the title with its index
    NSString *myIndex = [NSString stringWithFormat:@"%d", indexPath.row];
    NSString *myTitle = @"Research title ";
    NSString *myResearch = [NSString stringWithFormat:@"%@%@",myTitle,myIndex];

    
    cell.detailTextLabel.text = myResearch;
//    cell.detailTextLabel.text = @"Research title #%", myIndex;
//    NSLog(@"%ld",(long) indexPath.row);
    
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    //Data test
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
//    
//  
//    NSDictionary *dimensions = @{
//                                 // What type of news is this?
//                                 @"category": @"politics",
//                                 // Is it a weekday or the weekend?
//                                 @"dayType": @"weekday",
//                                 };
//    
//    // Send the dimensions to Parse along with the 'read' event
//    [PFAnalytics trackEvent:@"read" dimensions:dimensions];
    
    
    
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
