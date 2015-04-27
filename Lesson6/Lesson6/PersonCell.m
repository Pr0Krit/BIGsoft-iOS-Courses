//
//  PersonCell.m
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "PersonCell.h"

#define LABEL_PADDING 20.0

@implementation PersonCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configureCell];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureCell];
    }
    return self;
}

- (void)configureCell
{
    // Name Label.
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABEL_PADDING, 0.0, self.frame.size.width / 2.0 - LABEL_PADDING, self.frame.size.height)];
    self.nameLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.nameLabel];
    
    // Age Label.
    self.ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 2.0, 0.0, self.frame.size.width / 2.0 - LABEL_PADDING, self.frame.size.height)];
    self.ageLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    self.ageLabel.backgroundColor = [UIColor clearColor];
    self.ageLabel.textColor = [UIColor grayColor];
    self.ageLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.ageLabel];
    
    // Separator.
    CGFloat pixel = 1.0 / [UIScreen mainScreen].scale;
    self.separator = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height - pixel, self.frame.size.width, pixel)];
    self.separator.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.separator.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self addSubview:self.separator];
}

- (void)setPerson:(Person *)person
{
    _person = person;
    
    NSCharacterSet *whitespaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *cleanName = [person.name stringByTrimmingCharactersInSet:whitespaces];
    
    self.nameLabel.text = cleanName.length ? cleanName : @"Не указан";
    self.ageLabel.text = [person.age integerValue] ? [NSString stringWithFormat:@"%@", person.age] : @"Не указан";
//    if ([person.age integerValue]) {
//        self.ageLabel.text = [NSString stringWithFormat:@"%@", person.age];
//    } else {
//        self.ageLabel.text = @"Не указан";
//    }
}

@end
