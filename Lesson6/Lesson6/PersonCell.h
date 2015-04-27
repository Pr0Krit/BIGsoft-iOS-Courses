//
//  PersonCell.h
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonCell : UITableViewCell

@property (nonatomic) Person *person;

@property UILabel *nameLabel;
@property UILabel *ageLabel;
@property UIView *separator;

@end
