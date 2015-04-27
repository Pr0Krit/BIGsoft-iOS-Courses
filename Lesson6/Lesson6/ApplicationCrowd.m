//
//  ApplicationCrowd.m
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "ApplicationCrowd.h"

NSString *const ApplicationCrowdKey = @"ApplicationCrowdKey";

@implementation ApplicationCrowd

+ (NSArray *)sharedCrowd
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *crowdData = [userDefaults objectForKey:ApplicationCrowdKey];
    if (!crowdData.count) {
        return @[];
    }
    
    // Unarchive each person.
    NSMutableArray *crowd = [NSMutableArray new];
    for (NSData *personData in crowdData) {
        Person *person = [NSKeyedUnarchiver unarchiveObjectWithData:personData];
        [crowd addObject:person];
    }
    return crowd;
}

+ (void)setSharedCrowd:(NSArray *)crowd
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *crowdData = [NSMutableArray new];
    for (Person *person in crowd) {
        NSData *personData = [NSKeyedArchiver archivedDataWithRootObject:person];
        [crowdData addObject:personData];
    }
    [userDefaults setObject:crowdData forKey:ApplicationCrowdKey];
    [userDefaults synchronize];
}

@end
