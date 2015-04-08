//
//  Ship.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 09.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Ship.h"

@implementation Ship

- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight
{
    self = [super initWithName:name
                        weight:weight
                          type:TransportTypeWater];
    return self;
}

- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight
                        type:(TransportType)type
{
    self = [self initWithName:name
                       weight:weight];
    return self;
}

- (instancetype)init
{
    self = [self initWithName:@"Titanic"
                       weight:@(50000)];
    return self;
}

- (void)move
{
    NSLog(@"Ship \"%@\" is sailing.", self.name);
}

@end
