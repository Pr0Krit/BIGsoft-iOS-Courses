//
//  Person.h
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age;

@property NSString *name;
@property NSNumber *age;

@end
