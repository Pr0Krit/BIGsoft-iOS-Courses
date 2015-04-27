//
//  AppDelegate.m
//  Lesson5
//
//  Created by Timur Bernikowich on 18.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "AppDelegate.h"

NSString *const DefaultUserKey = @"DefaultUserKey";

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    return YES;
}

- (User *)currentUser
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *userData = [userDefaults objectForKey:DefaultUserKey];
    if (userData) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:userData];
    }
    return nil;
}

- (void)setCurrentUser:(User *)newUser
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:newUser];
    [userDefaults setObject:userData forKey:DefaultUserKey];
    [userDefaults synchronize];

}

@end
