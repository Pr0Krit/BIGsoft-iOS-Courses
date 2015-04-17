//
//  ContactCell.m
//  Lesson4
//
//  Created by Timur Bernikowich on 11.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "ContactCell.h"

#define CONTACT_CELL_HEIGHT 50.0f

@implementation ContactCell

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
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width / 2.0f, self.frame.size.height);
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    self.button = button;
    [self addSubview:self.button];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 2.0f, 0, self.frame.size.width / 2.0f, self.frame.size.height)];
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    label.textAlignment = NSTextAlignmentCenter;
    self.label = label;
    [self addSubview:self.label];
}

#pragma mark - Actions

- (void)buttonPressed:(id)sender
{
    if (self.delegate) {
        [self.delegate contactCellPressedButton:self];
    }
}

#pragma mark - Appearance

+ (CGFloat)height
{
    return CONTACT_CELL_HEIGHT;
}

@end
