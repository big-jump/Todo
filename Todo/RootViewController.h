//
//  RootViewController.h
//  Todo
//
//  Created by John Jusayan on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSDateFormatter *dueDateFormatter;
- (void)toggleDone:(UISwipeGestureRecognizer*)sender;

@end
