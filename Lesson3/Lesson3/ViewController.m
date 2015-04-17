//
//  ViewController.m
//  Lesson3
//
//  Created by Timur Bernikowich on 04.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "ViewController.h"
#import "WeatherVC.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic) UIButton *moscowButton;
@property (nonatomic) UISwitch *switchView;
@property (nonatomic) UISegmentedControl *segmentedControl;
@property (nonatomic) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Views.
    [self.view addSubview:self.moscowButton];
    [self.view addSubview:self.switchView];
    [self.view addSubview:self.segmentedControl];
    [self.view addSubview:self.textField];
    [self.textField becomeFirstResponder];
}

#pragma mark - Views

- (UIButton *)moscowButton
{
    if (!_moscowButton) {
        UIButton *moscowButton = [UIButton buttonWithType:UIButtonTypeSystem];
        CGRect frame = CGRectMake(0, 0, 80.0f, 30.0f);
        frame.origin.x = self.view.frame.size.width - frame.size.width - 16.0f;
        moscowButton.frame = frame;
        moscowButton.center = CGPointMake(moscowButton.center.x, self.view.frame.size.height / 2.0f);
        moscowButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
        [moscowButton addTarget:self action:@selector(showWeather:) forControlEvents:UIControlEventTouchUpInside];
        [moscowButton setTitle:@"Moscow" forState:UIControlStateNormal];
        _moscowButton = moscowButton;
    }
    return _moscowButton;
}

- (UISwitch *)switchView
{
    if (!_switchView) {
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        CGRect frame = switchView.frame;
        frame.origin.y = self.navigationController.navigationBar.frame.size.height + 42.0f;
        switchView.frame = frame;
        switchView.center = CGPointMake(self.view.frame.size.width / 2.0f, switchView.center.y);
        switchView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [switchView addTarget:self action:@selector(switchChangedState:) forControlEvents:UIControlEventValueChanged];
        _switchView = switchView;
    }
    return _switchView;
}

- (UISegmentedControl *)segmentedControl
{
    if (!_segmentedControl) {
        NSArray *items = @[@"one", @"two", @"three"];
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
        segmentedControl.center = CGPointMake(self.view.frame.size.width / 2.0f, 200.0f);
        [segmentedControl addTarget:self action:@selector(segmentedControlChangedState:) forControlEvents:UIControlEventValueChanged];
        _segmentedControl = segmentedControl;
    }
    return _segmentedControl;
}

- (UITextField *)textField
{
    if (!_textField) {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(16.0f, 360.0f, self.view.frame.size.width - 2 * 16.0f, 50.0f)];
        textField.delegate = self;
        textField.placeholder = @"Your name goes here...";
        textField.textAlignment = NSTextAlignmentCenter;
        textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.returnKeyType = UIReturnKeyDone;
        _textField = textField;
    }
    return _textField;
}

#pragma mark - Text Field Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newString isEqualToString:@"end"]) {
        [textField resignFirstResponder];
        textField.text = newString;
    }

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - Actions

- (IBAction)showWeather:(UIButton *)sender
{
    NSString *city = [sender titleForState:UIControlStateNormal];
    [self showWeatherForCity:city];
}

- (void)switchChangedState:(UISwitch *)sender
{
    NSString *switchState = sender.isOn ? @"ON" : @"OFF";
    // Is equal to next code:
//    NSString *switchState;
//    if (sender.isOn) {
//        switchState = @"YES";
//    } else {
//        switchState = @"NO";
//    }

    NSLog(@"Switch is %@.", switchState);
}

- (void)segmentedControlChangedState:(UISegmentedControl *)segmentedControl
{
    NSString *selectedItem = [self.segmentedControl titleForSegmentAtIndex:self.segmentedControl.selectedSegmentIndex];
    NSLog(@"Selected segment: %@", selectedItem);
}

#pragma mark - Segues

- (void)showWeatherForCity:(NSString *)city
{
    BOOL useSegue = NO;
    if (useSegue) {
        [self performSegueWithIdentifier:@"ShowWeather" sender:city];
    } else {
        WeatherVC *weatherVC = [WeatherVC new];
        weatherVC.currentCity = city;
        BOOL useNavigationController = YES;
        if (useNavigationController) {
            [self.navigationController pushViewController:weatherVC animated:YES];
        } else {
            [self presentViewController:weatherVC animated:YES completion:nil];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowWeather"]) {
        WeatherVC *weatherVC = (WeatherVC *)segue.destinationViewController;
        NSString *city = (NSString *)sender;
        weatherVC.currentCity = city;
    }
}

@end
