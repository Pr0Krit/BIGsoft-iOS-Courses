//
//  Contact+Creation.m
//  Lesson7
//
//  Created by Timur Bernikowich on 25.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Contact+Creation.h"
#import "AppDelegate.h"

@implementation Contact (Creation)

+ (Contact *)contactWithName:(NSString *)name age:(NSNumber *)age
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    Contact *contact = (Contact *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(self) inManagedObjectContext:context];
    if (contact) {
        contact.name = name;
        contact.age = age;
    }
    return contact;
}

@end
