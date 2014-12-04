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
#import "researchDocViewController.h"
#import <Parse/Parse.h>
@interface ResearchViewViewController ()

@end

@implementation ResearchViewViewController


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"I was clicked at %@", indexPath);

//    UIViewController *researchDoc = [[researchDoc alloc] initWithNibName:@"researchDoc" bundle:nil];
//    UIViewController *researchView = [[ResearchViewViewController alloc] init];

    researchDocViewController *researchDoc = [[researchDocViewController alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Research"];
    NSArray *objects = [query findObjects];

    if (objects.count > 0) {
        PFObject *researches = objects[indexPath.row];
        
        //      Takes the title of the investigation
        NSLog(@"The object id %@", researches.objectId);
        researchDoc.objectId = researches.objectId;
    }

    [self.navigationController pushViewController:researchDoc animated:YES];

    
    //    [researchDoc ]
    
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
    
//    PFQuery *query = [PFQuery queryWithClassName:@"Research"];
    
//    [query whereKey:@"Title" equalTo:@"Daniel"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            // The find succeeded.
//            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
//            NSLog(@"The object in row %d is %@",indexPath.row, objects[indexPath.row]);
//            // Do something with the found objects
//            for (PFObject *object in objects) {
//                NSLog(@"%@", object.objectId);
//            }
//        } else {
//            // Log details of the failure
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//    }];
    
    //Sends the view to the researchDoc
//    [self.navigationController pushViewController:researchDoc animated:YES];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    PFQuery *researchesQ = [PFQuery queryWithClassName:@"Research"];

    int amount = researchesQ.countObjects;
    
    if (amount > 0) {
        return amount;
    } else {
        return 0;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
//    NSLog(@"Entered the row %d",indexPath.row);
    PFQuery *query = [PFQuery queryWithClassName:@"Research"];
    NSArray *objects = [query findObjects];
   
    if (objects.count > 0) {
        PFObject *researches = objects[indexPath.row];
//      Takes the title of the investigation 
        cell.detailTextLabel.text = researches[@"Title"];
    }
//            cell.detailTextLabel.text =@"Research Title";

    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    UISearchBar  *sBar = [[UISearchBar alloc]initWithFrame:CGRectMake(300,10,self.navigationController.navigationBar.bounds.size.width/3,self.navigationController.navigationBar.bounds.size.height/2)];
//    sBar.delegate = self;
//    [self.navigationController.navigationBar addSubview:sBar];
    
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
