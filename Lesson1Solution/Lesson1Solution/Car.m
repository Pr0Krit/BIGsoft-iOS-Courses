//
//  Car.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 09.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight
{
    self = [super initWithName:name
                        weight:weight
                          type:TransportTypeGround];
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
    self = [self initWithName:@"Volvo"
                       weight:@(2000)];
    return self;
}

- (void)move
{
    NSLog(@"Car \"%@\" is riding.", self.name);
}

@end
