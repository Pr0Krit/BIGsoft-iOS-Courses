//
//  Transport.h
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 08.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Moving.h"

typedef NS_ENUM(NSUInteger, TransportType) {
    TransportTypeAir,
    TransportTypeGround,
    TransportTypeWater,
    TransportTypesCount
};

@interface Transport : NSObject <Moving>

@property (readonly) NSString *name;
@property (readonly) NSNumber *weight;
@property (readonly) TransportType type;

- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight
                        type:(TransportType)type;

+ (NSString *)typeNameWithType:(TransportType)transportType;

@end
