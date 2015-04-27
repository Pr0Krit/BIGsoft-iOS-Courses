//
//  User.m
//  Lesson5
//
//  Created by Timur Bernikowich on 18.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "User.h"

NSString *const UserNameKey = @"UserNameKey";
NSString *const UserAgeKey = @"UserAgeKey";

@implementation User

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@", self.name, self.age];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:UserNameKey];
    [aCoder encodeObject:self.age forKey:UserAgeKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:UserNameKey];
        self.age = [aDecoder decodeObjectForKey:UserAgeKey];
    }
    return self;
}

@end
