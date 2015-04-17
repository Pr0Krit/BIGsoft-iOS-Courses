//
//  ContactCell.h
//  Lesson4
//
//  Created by Timur Bernikowich on 11.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactCell;

@protocol ContactCellDelegate <NSObject>

- (void)contactCellPressedButton:(ContactCell *)cell;

@end

@interface ContactCell : UITableViewCell

@property UILabel *label;
@property UIButton *button;

@property (nonatomic, weak) id <ContactCellDelegate> delegate;

+ (CGFloat)height;

@end
