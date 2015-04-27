//
//  ApplicationCrowd.h
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface ApplicationCrowd : NSObject

+ (NSArray *)sharedCrowd;
+ (void)setSharedCrowd:(NSArray *)crowd;

@end
