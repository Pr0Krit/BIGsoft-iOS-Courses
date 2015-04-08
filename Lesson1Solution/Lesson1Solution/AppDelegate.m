//
//  AppDelegate.m
//  Lesson1Solution
//
//  Created by Timur Bernikowich on 08.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "AppDelegate.h"

// Models.
#import "Man.h"
#import "Woman.h"
#import "Car.h"
#import "Ship.h"
#import "Plane.h"
#import "Train.h"

// Helpers.
#import "NSObject+Superclass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSInteger numberOfLevels = 5;
    for (NSInteger level = 1; level <= numberOfLevels; level++) {
        [self runLevel:level];
    }
    return YES;
}

- (void)runLevel:(NSInteger)level
{
    NSLog(@"Level %ld", (long)level);

    Car *car = [Car new];
    Ship *ship = [Ship new];
    Plane *plane = [Plane new];
    Train *train = [Train new];
    Man *man = [Man new];
    Woman *woman = [Woman new];

    switch (level) {
        case 1: {
            NSArray *transports = @[car, ship, plane];
            for (Transport *transport in transports) {
                NSLog(@"%@", transport);
                [transport move];
            }
            break;
        }
        case 2: {
            NSArray *transports = @[car, ship, plane, train];
            for (Transport *transport in [transports reverseObjectEnumerator]) {
                NSLog(@"%@", transport);
            }
            break;
        }
        case 3: {
            NSArray *objects = @[car, ship, man, plane, train, woman];
            for (id <Moving> object in objects) {
                NSLog(@"%@ - %@", NSStringFromClass([object class]), object);
                [object move];
            }
            break;
        }
        case 4: {
            NSArray *transport = @[car, ship, plane, train];
            NSArray *people = @[man, woman];
            for (NSInteger index = 0; index < transport.count || index < people.count; index++) {
                if (index < transport.count) {
                    NSLog(@"%@", transport[index]);
                }
                if (index < people.count) {
                    NSLog(@"%@", people[index]);
                }
            }
            break;
        }
        case 5: {
            NSMutableArray *objects = [@[car, ship, man, plane, train, woman] mutableCopy];
            NSLog(@"Unsorted array:\n%@", objects);

            // Sort by types (Transport, Person).
            NSArray *typeClasses = @[NSStringFromClass([Transport class]), NSStringFromClass([Person class])];
            NSSortDescriptor *typeSort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES comparator:^NSComparisonResult(id object1, id object2) {
                NSString *class1 = [object1 superclassFromArray:typeClasses];
                NSString *class2 = [object2 superclassFromArray:typeClasses];
                return [class1 compare:class2];
            }];

            // Sort by name, or by first name if objects are people.
            NSComparator peopleComparator = ^(Person *person1, Person *person2) {
                return [person1.firstName compare:person2.firstName];
            };
            NSComparator transportComparator = ^(Transport *transport1, Transport *transport2) {
                return [transport1.name compare:transport2.name];
            };
            NSSortDescriptor *nameSort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES comparator:^(id object1, id object2) {
                if ([object1 isKindOfClass:[Person class]] &&
                    [object2 isKindOfClass:[Person class]]) {
                    return peopleComparator(object1, object2);
                }
                if ([object1 isKindOfClass:[Transport class]] &&
                    [object2 isKindOfClass:[Transport class]]) {
                    return transportComparator(object1, object2);
                }
                return NSOrderedSame;
            }];

            [objects sortUsingDescriptors:@[typeSort, nameSort]];
            NSLog(@"Sorted array:\n%@", objects);
        }
        default:
            break;
    }
}

@end
