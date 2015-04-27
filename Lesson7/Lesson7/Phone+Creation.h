//
//  Phone+Creation.h
//  Lesson7
//
//  Created by Timur Bernikowich on 25.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "Phone.h"

@interface Phone (Creation)

+ (Phone *)phoneWithNumber:(NSString *)number owner:(Contact *)contact;

@end
