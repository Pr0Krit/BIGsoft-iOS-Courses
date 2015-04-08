//
//  Man.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 08.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Man.h"

@implementation Man

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSNumber *)age
{
    self = [super initWithFirstName:firstName
                           lastName:lastName
                                age:age
                             gender:PersonGenderMale];
    return self;
}

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSNumber *)age
                           gender:(PersonGender)gender
{
    self = [self initWithFirstName:firstName
                          lastName:lastName
                               age:age];
    return self;
}

- (instancetype)init
{
    self = [self initWithFirstName:@"Timur"
                          lastName:@"Bernikowich"
                               age:@(20)];
    return self;
}

@end
