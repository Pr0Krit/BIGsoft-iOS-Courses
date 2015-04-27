//
//  MasterViewController.m
//  Lesson7
//
//  Created by Timur Bernikowich on 25.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Contact+Creation.h"

@interface MasterViewController ()

@property NSArray *contacts;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    [self reload];
}

- (void)insertNewObject:(id)sender
{
    NSArray *names = @[@"Tim", @"John", @"Mark"];
    NSInteger randomIndex = arc4random() % names.count;
    NSString *name = names[randomIndex];
    NSNumber *age = @(arc4random() % 11 + 20);
    [Contact contactWithName:name age:age];
    
    [self reload];
    
    // Save the context.
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (void)reload
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Contact class])];
    NSSortDescriptor *nameSort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSSortDescriptor *ageSort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
    request.sortDescriptors = @[nameSort, ageSort];
    NSArray *contacts = [self.managedObjectContext executeFetchRequest:request error:nil];
    self.contacts = contacts;
    [self.tableView reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSManagedObject *object = self.contacts[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = [@[contact.name, contact.age] componentsJoinedByString:@", "];
}

@end
