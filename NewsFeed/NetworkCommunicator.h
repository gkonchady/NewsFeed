//
//  NetworkCommunicator.h
//  NewsFeed
//
//  Created by Gaurav Konchady on 10/12/15.
//  Copyright © 2015 Gaurav Konchady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface NetworkCommunicator : NSObject

- (instancetype)initWithUrl:(NSString *)url withParams:(NSDictionary *)params;
- (void)getArticlesFromSource:(void(^)(NSData *data, NSError *error))completionHandler;

@end
