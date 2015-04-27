//
//  ViewController.h
//  Lesson5
//
//  Created by Timur Bernikowich on 18.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)saveButtonPressed:(id)sender;

@end

