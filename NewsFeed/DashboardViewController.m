//
//  DashboardViewController.m
//  NewsFeed
//
//  Created by Gaurav Konchady on 10/1/15.
//  Copyright © 2015 Gaurav Konchady. All rights reserved.
//

#import "DashboardViewController.h"
#import "FeedViewController.h"

@interface DashboardViewController ()

@property NSDictionary *objects;
@property NSArray *contents;
@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"sources" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filepath];
    NSError *error;
    self.objects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    self.contents = [self.objects allKeys];
    self.detailViewController = (FeedViewController *)[[self.splitViewController.viewControllers
      lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FeedViewController *controller = (FeedViewController *)[[segue destinationViewController]
          topViewController];
        [controller setDetailItem:[self.contents objectAtIndex:indexPath.row]];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.contents objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
