//
//  NSObject+Superclass.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 09.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "NSObject+Superclass.h"

@implementation NSObject (Superclass)

- (NSString *)superclassFromArray:(NSArray *)array
{
    for (NSString *className in array) {
        Class class = NSClassFromString(className);
        if ([self isKindOfClass:class]) {
            return className;
        }
    }
    return nil;
}

@end
