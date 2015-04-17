//
//  UIView+FastResizing.m
//  Lesson2
//
//  Created by Timur Bernikowich on 28.03.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "UIView+FastResizing.h"

@implementation UIView (FastResizing)

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

@end