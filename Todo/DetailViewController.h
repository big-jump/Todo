//
//  DetailViewController.h
//  Todo
//
//  Created by John Jusayan on 7/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TodoItem;

@interface DetailViewController : UITableViewController

@property (nonatomic, retain) TodoItem *detailItem;
@property (nonatomic, retain) NSDateFormatter *dueDateFormatter;
@end
