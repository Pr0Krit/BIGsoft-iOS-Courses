//
//  Person.m
//  Lesson1
//
//  Created by Timur Bernikowich on 21.03.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    // Это обычный конструктор для нашего класса.
    // В него я добавил значения по умолчанию.
    self = [super init];
    if (self) {
        self.lastName = @"Берникович";
        self.firstName = @"Тимур";
        self.age = @(20);
    }
    return self;
}

- (instancetype)initWithLastName:(NSString *)lastName firstName:(NSString *)firstName age:(NSNumber *)age
{
    // Вот это уже наш конструктор не по умолчанию.
    // Тут мы будем проставлять передаваймые значения.
    self = [self init];
    if (self) {
        self.lastName = lastName;
        self.firstName = firstName;
        self.age = age;
    }
    return self;
}

+ (instancetype)personWithLastName:(NSString *)lastName firstName:(NSString *)firstName age:(NSNumber *)age
{
    // Способ реализации конструктора через '+' метод, т.е. через метод класса.
    return [[Person alloc] initWithLastName:lastName firstName:firstName age:age];
}

- (NSString *)description
{
    // Переопределяем метод, который объявлен в NSObject,
    // так как мы его наследники, мы может это сделать.
    // Этот метод используется для NSLog и для 'stringWithFormat:'.
    NSString *personDescription = [NSString stringWithFormat:@"%@ %@, %@", self.lastName, self.firstName, self.age];
    return personDescription;
}

@end
