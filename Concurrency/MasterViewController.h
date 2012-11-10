//
//  MasterViewController.h
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
