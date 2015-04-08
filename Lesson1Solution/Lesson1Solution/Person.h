//
//  Person.h
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 08.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Moving.h"

typedef NS_ENUM(NSUInteger, PersonGender) {
    PersonGenderMale,
    PersonGenderFemale,
    PersonGendersCount
};

@interface Person : NSObject <Moving>

@property NSString *firstName;
@property NSString *lastName;
@property NSNumber *age;
@property PersonGender gender;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSNumber *)age
                           gender:(PersonGender)gender;

@end
