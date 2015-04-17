//
//  ViewController.h
//  Lesson2
//
//  Created by Timur Bernikowich on 28.03.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIButton *button;

- (IBAction)buttonPressed:(id)sender;

@end
