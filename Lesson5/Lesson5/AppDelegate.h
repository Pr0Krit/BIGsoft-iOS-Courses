//
//  AppDelegate.h
//  Lesson5
//
//  Created by Timur Bernikowich on 18.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (User *)currentUser;
- (void)setCurrentUser:(User *)newUser;

@end

