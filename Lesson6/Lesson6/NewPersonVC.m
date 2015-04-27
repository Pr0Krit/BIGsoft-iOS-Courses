//
//  NewPersonVC.m
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "NewPersonVC.h"

@interface NewPersonVC ()

@end

@implementation NewPersonVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)addButtonPressed:(id)sender
{
    NSString *name = self.nameField.text;
    NSNumber *age = @([self.ageField.text integerValue]);
    Person *person = [[Person alloc] initWithName:name age:age];
    if (self.delegate) {
        [self.delegate newPersonVC:self didCreateNewPerson:person];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
