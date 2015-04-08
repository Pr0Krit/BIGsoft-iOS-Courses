//
//  Plane.h
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 09.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Transport.h"

@interface Plane : Transport

- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight;

@end
