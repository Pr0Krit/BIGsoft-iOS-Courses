//
//  Contact+Creation.h
//  Lesson7
//
//  Created by Timur Bernikowich on 25.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Contact.h"

@interface Contact (Creation)

+ (Contact *)contactWithName:(NSString *)name age:(NSNumber *)age;

@end
