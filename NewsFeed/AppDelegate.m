//
//  AppDelegate.m
//  NewsFeed
//
//  Created by Gaurav Konchady on 10/1/15.
//  Copyright © 2015 Gaurav Konchady. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:
    (NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UISplitViewController *splitViewController = (UISplitViewController *)
      self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem =
      splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;
    return YES;
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController
    collapseSecondaryViewController:(UIViewController *)secondaryViewController
    ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] &&
        [[(UINavigationController *)secondaryViewController topViewController]
         isKindOfClass:[FeedViewController class]] &&
        ([(FeedViewController *)[(UINavigationController *)secondaryViewController topViewController]
          detailItem] == nil)) {
        return YES;
    } else {
        return NO;
    }
}

@end
