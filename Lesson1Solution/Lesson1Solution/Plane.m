//
//  Plane.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 09.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Plane.h"

@implementation Plane

- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight
{
    self = [super initWithName:name
                        weight:weight
                          type:TransportTypeAir];
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
    self = [self initWithName:@"Il-2"
                       weight:@(5000)];
    return self;
}

- (void)move
{
    NSLog(@"Plane \"%@\" is flying.", self.name);
}

@end
