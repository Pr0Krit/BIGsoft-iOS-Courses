//
//  ViewController.m
//  Lesson4
//
//  Created by Timur Bernikowich on 11.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "ViewController.h"
#import "ContactCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, ContactCellDelegate>

@property UITableView *tableView;

@property NSArray *contacts;
@property NSMutableArray *blocked;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Table View";

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[ContactCell class] forCellReuseIdentifier:NSStringFromClass([ContactCell class])];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:self.tableView];

    NSMutableArray *contacts = [NSMutableArray new];
    [contacts addObject:@"Sergey"];
    [contacts addObject:@"Andrey"];
    [contacts addObject:@"Misha"];
    [contacts addObject:@"Timur"];
    self.contacts = contacts;

    NSMutableArray *blocked = [NSMutableArray new];
    [blocked addObject:@NO]; // [NSNumber numberWithBool:NO];
    [blocked addObject:@NO];
    [blocked addObject:@NO];
    [blocked addObject:@NO];
    self.blocked = blocked;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
        cell.textLabel.text = self.contacts[indexPath.row];
        return cell;
    } else {
        ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ContactCell class]) forIndexPath:indexPath];
        cell.label.text = self.contacts[indexPath.row];
        BOOL isBlocked = [self.blocked[indexPath.row] boolValue];
        NSString *buttonTitle = isBlocked ? @"Unblock" : @"Block";
        [cell.button setTitle:buttonTitle forState:UIControlStateNormal];
        cell.delegate = self;
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 20.0f)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];

    if (section == 0) {
        label.text = @"Default cells";
    } else {
        label.text = @"Custom cells";
    }

    return label;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 44.0f;
    } else {
        return [ContactCell height];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSelector:@selector(deselectRowAtIndexPath:) withObject:indexPath afterDelay:0.3];

    NSString *contact = self.contacts[indexPath.row];
    NSLog(@"%@", contact);
}

- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Contact Cell Delegate

- (void)contactCellPressedButton:(ContactCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSNumber *blocked = self.blocked[indexPath.row];
    BOOL isBlocked = [blocked boolValue];
    isBlocked = !isBlocked;
    blocked = @(isBlocked);
    self.blocked[indexPath.row] = blocked;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
