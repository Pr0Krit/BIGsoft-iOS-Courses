//
//  Person.h
//  Lesson1
//
//  Created by Timur Bernikowich on 21.03.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *lastName;
@property NSString *firstName;
@property NSNumber *age;

- (instancetype)initWithLastName:(NSString *)lastName firstName:(NSString *)firstName age:(NSNumber *)age;
+ (instancetype)personWithLastName:(NSString *)lastName firstName:(NSString *)firstName age:(NSNumber *)age;

@end