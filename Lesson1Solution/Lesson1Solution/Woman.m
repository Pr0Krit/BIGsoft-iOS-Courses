//
//  Woman.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 08.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Woman.h"

@implementation Woman

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSNumber *)age
{
    self = [super initWithFirstName:firstName
                           lastName:lastName
                                age:age
                             gender:PersonGenderFemale];
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
    self = [self initWithFirstName:@"Sasha"
                          lastName:@"Grey"
                               age:@(27)];
    return self;
}

@end
