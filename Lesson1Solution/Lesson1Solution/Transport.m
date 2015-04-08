//
//  Transport.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 08.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Transport.h"

@interface Transport ()

@end

@implementation Transport

- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight
                        type:(TransportType)type
{
    self = [super init];
    if (self) {
        _name = name;
        _weight = weight;
        _type = type;
    }
    return self;
}

- (void)move
{
    NSLog(@"%@ is moving.", self.name);
}

- (NSString *)description
{
    NSString *type = [Transport typeNameWithType:self.type];
    return [NSString stringWithFormat:@"%@, %@, %@", type, self.name, self.weight];
}

#pragma mark - Helpers

+ (NSString *)typeNameWithType:(TransportType)transportType
{
    switch (transportType) {
        case TransportTypeAir: return @"Air";
        case TransportTypeGround: return @"Ground";
        case TransportTypeWater: return @"Water";
        default: return nil;
    }
}

@end
