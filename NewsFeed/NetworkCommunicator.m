//
//  NetworkCommunicator.m
//  NewsFeed
//
//  Created by Gaurav Konchady on 10/12/15.
//  Copyright © 2015 Gaurav Konchady. All rights reserved.
//

#import "NetworkCommunicator.h"

@interface NetworkCommunicator()
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSDictionary *params;
@end

@implementation NetworkCommunicator

- (instancetype)initWithUrl:(NSString *)url withParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        _url = url;
        _params = params;
    }
    return self;
}

- (void)getArticlesFromSource:(void(^)(NSData *data, NSError *error))completionHandler{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFXMLParserResponseSerializer new];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/rss+xml"];
    [manager GET:self.url parameters:self.params success:^(AFHTTPRequestOperation *operation,
      id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        completionHandler(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completionHandler(nil, error);
    }];
}

@end
