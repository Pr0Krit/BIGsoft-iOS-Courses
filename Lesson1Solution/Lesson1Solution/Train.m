//
//  Train.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 09.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Train.h"

@implementation Train

- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight
              numberOfWagons:(NSNumber *)numberOfWagons
{
    self = [super initWithName:name
                        weight:weight
                          type:TransportTypeGround];
    if (self) {
        _numberOfWagons = numberOfWagons;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name weight:(NSNumber *)weight type:(TransportType)type
{
    self = [self initWithName:name
                       weight:weight
               numberOfWagons:@(1)];
    return self;
}

- (instancetype)init
{
    self = [self initWithName:@"Hogwarts Express"
                       weight:@(100000)
               numberOfWagons:@(13)];
    return self;
}

- (void)move
{
    NSLog(@"Train \"%@\" is running.", self.name);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@", [super description], self.numberOfWagons];
}

@end
