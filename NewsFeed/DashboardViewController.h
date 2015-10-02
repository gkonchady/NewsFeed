//
//  DashboardViewController.h
//  NewsFeed
//
//  Created by Gaurav Konchady on 10/1/15.
//  Copyright © 2015 Gaurav Konchady. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeedViewController;

@interface DashboardViewController : UITableViewController

@property (strong, nonatomic) FeedViewController *detailViewController;


@end

