//
//  TodoItem.h
//  Todo
//
//  Created by John Jusayan on 7/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TodoItem : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * done;

@end
