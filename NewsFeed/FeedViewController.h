//
//  FeedViewController.h
//  NewsFeed
//
//  Created by Gaurav Konchady on 10/1/15.
//  Copyright © 2015 Gaurav Konchady. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

