//
//  CrowdVC.m
//  Lesson6
//
//  Created by Timur Bernikowich on 19.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "CrowdVC.h"
#import "ApplicationCrowd.h"
#import "PersonCell.h"
#import "NewPersonVC.h"

@interface CrowdVC () <UITableViewDataSource, UITableViewDelegate, NewPersonVCDelegate>

@property UITableView *tableView;
@property NSArray *crowd;

@end

@implementation CrowdVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Table View creation.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.tableView registerClass:[PersonCell class] forCellReuseIdentifier:NSStringFromClass([PersonCell class])];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self reloadData];
}

- (void)reloadData
{
    self.crowd = [ApplicationCrowd sharedCrowd];
    [self.tableView reloadData];
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        [self performSegueWithIdentifier:@"AddPersonSegue" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPersonSegue"]) {
        NewPersonVC *vc = (NewPersonVC *)segue.destinationViewController;
        vc.delegate = self;
    }
}

- (void)newPersonVC:(NewPersonVC *)newPersonVC didCreateNewPerson:(Person *)newPerson
{
    NSMutableArray *crowd = [[ApplicationCrowd sharedCrowd] mutableCopy];
    [crowd insertObject:newPerson atIndex:0];
    [ApplicationCrowd setSharedCrowd:crowd];
    
    [self reloadData];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return self.crowd.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PersonCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PersonCell class]) forIndexPath:indexPath];
        cell.person = nil;
        cell.nameLabel.text = @"Add person";
        cell.ageLabel.text = @">";
        return cell;
    } else {
        PersonCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PersonCell class]) forIndexPath:indexPath];
        Person *person = self.crowd[indexPath.row];
        cell.person = person;
        return cell;
    }
}

@end
