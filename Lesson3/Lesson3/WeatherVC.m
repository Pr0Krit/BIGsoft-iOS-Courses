//
//  WeatherVC.m
//  Lesson3
//
//  Created by Timur Bernikowich on 04.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "WeatherVC.h"

@interface WeatherVC ()

@property UILabel *label;

@end

@implementation WeatherVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    // Views.
    self.label = [[UILabel alloc] initWithFrame:self.view.bounds];
    self.label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.label.textColor = [UIColor greenColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = self.currentCity;
    [self.view addSubview:self.label];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setCurrentCity:(NSString *)currentCity
{
    _currentCity = currentCity;

    self.label.text = currentCity;
}

@end
