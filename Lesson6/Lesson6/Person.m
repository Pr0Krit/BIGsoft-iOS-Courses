//
//  Person.m
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Person.h"

NSString *const PersonNameKey = @"PersonNameKey";
NSString *const PersonAgeKey = @"PersonAgeKey";

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@", self.name, self.age];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:PersonNameKey];
        _age = [aDecoder decodeObjectForKey:PersonAgeKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:PersonNameKey];
    [aCoder encodeObject:self.age forKey:PersonAgeKey];
}

@end
