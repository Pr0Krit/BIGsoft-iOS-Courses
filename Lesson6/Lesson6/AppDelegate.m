//
//  AppDelegate.m
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "AppDelegate.h"
#import "ApplicationCrowd.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray *applicationCrowd = [ApplicationCrowd sharedCrowd];
    NSLog(@"%@", applicationCrowd);
    
    // Uncomment to clean crowd.
//    [ApplicationCrowd setSharedCrowd:nil];
    
    // Uncomment to add test persons.
//    Person *testPerson1 = [[Person alloc] initWithName:@"Timur" age:@(25)];
//    Person *testPerson2 = [[Person alloc] initWithName:@"Maxim" age:@(31)];
//    Person *testPerson3 = [[Person alloc] initWithName:@"Viktor" age:@(13)];
//    NSArray *testCrowd = @[testPerson1, testPerson2, testPerson3];
//    [ApplicationCrowd setSharedCrowd:testCrowd];
    
    return YES;
}

@end
