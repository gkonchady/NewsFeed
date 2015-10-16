//
//  FeedViewController.m
//  NewsFeed
//
//  Created by Gaurav Konchady on 10/1/15.
//  Copyright © 2015 Gaurav Konchady. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDictionary *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem allKeys][0];
    }
    NetworkCommunicator *nc = [[NetworkCommunicator alloc] initWithUrl:[self.detailItem allValues][0] withParams:nil];
    [nc getArticlesFromSource:^(NSData *data, NSError *error) {
        if(error) {
            NSLog(@"got error");
        } else {
            NSLog(@"got response");
        }
    }];
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
