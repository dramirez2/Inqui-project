//
//  ResearchViewViewController.h
//  Inqui
//
//  Created by Daniel Ramirez Calderon on 11/24/14.
//  Copyright (c) 2014 Inqui Project. All rights reserved.
//

//El data source vendria siendo la data de la base de datos
#import <UIKit/UIKit.h>
//son para añadir cosas <>

@interface ResearchViewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) NSString *objectIds;

@end

