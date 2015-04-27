//
//  ViewController.m
//  Lesson5
//
//  Created by Timur Bernikowich on 18.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Plist test.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"plist" inDirectory:@"Folder"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@", dictionary);
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    User *user = [appDelegate currentUser];
    self.textField.text = user.name;
}

- (IBAction)saveButtonPressed:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    User *user = [appDelegate currentUser];
    if (!user) {
        user = [User new];
    }
    user.name = self.textField.text;
    [appDelegate setCurrentUser:user];
}

@end
