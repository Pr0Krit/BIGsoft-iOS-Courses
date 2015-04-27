//
//  Phone+Creation.m
//  Lesson7
//
//  Created by Timur Bernikowich on 25.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Phone+Creation.h"
#import "AppDelegate.h"

@implementation Phone (Creation)

+ (Phone *)phoneWithNumber:(NSString *)number owner:(Contact *)contact
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    Phone *phone = (Phone *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(self) inManagedObjectContext:context];
    if (phone) {
        phone.number = number;
        phone.owner = contact;
    }
    return phone;
}

@end
