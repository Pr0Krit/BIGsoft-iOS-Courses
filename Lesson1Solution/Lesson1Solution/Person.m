//
//  Person.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 08.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Person.h"

@interface Person ()

@end

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSNumber *)age
                           gender:(PersonGender)gender
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _age = age;
        _gender = gender;
    }
    return self;
}

- (void)move
{
    NSLog(@"%@ %@ is moving.", self.firstName, self.lastName);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@, %@", self.firstName, self.lastName, self.age];
}

@end
