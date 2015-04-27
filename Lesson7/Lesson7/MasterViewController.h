//
//  MasterViewController.h
//  Lesson7
//
//  Created by Timur Bernikowich on 25.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

