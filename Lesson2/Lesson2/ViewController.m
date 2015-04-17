//
//  ViewController.m
//  Lesson2
//
//  Created by Timur Bernikowich on 28.03.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FastResizing.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect greenViewFrame = CGRectMake(0.0, 0.0, 100.0, 20.0);
    UIView *greenView = [[UIView alloc] initWithFrame:greenViewFrame];
    greenView.center = CGPointMake(self.view.width / 2.0, self.view.frame.size.height / 2.0);
    greenView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleRightMargin |
                                  UIViewAutoresizingFlexibleLeftMargin |
                                  UIViewAutoresizingFlexibleBottomMargin);
    greenView.backgroundColor = [UIColor greenColor];
    greenView.alpha = 0.0;
    [self.view addSubview:greenView];
    [UIView animateWithDuration:2.0 animations:^() {
        greenView.alpha = 1.0;
    }];
}

- (IBAction)buttonPressed:(id)sender
{
    [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

@end
