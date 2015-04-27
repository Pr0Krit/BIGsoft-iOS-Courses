//
//  NewPersonVC.h
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@class NewPersonVC;

@protocol NewPersonVCDelegate <NSObject>

- (void)newPersonVC:(NewPersonVC *)newPersonVC didCreateNewPerson:(Person *)newPerson;

@end

@interface NewPersonVC : UIViewController

@property (nonatomic) id <NewPersonVCDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;

- (IBAction)addButtonPressed:(id)sender;

@end
