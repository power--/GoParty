//
//  AFGoPartyApiClient.m
//  GoParty
//
//  Created by JoeTang on 14-3-2.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "AFJSONRequestOperation.h"
#import "AFGoPartyApiClient.h"


static NSString * const kAFTwitterAPIBaseURLString = @"http://api.twitter.com/1/";

@implementation AFGoPartyApiClient

+ (AFGoPartyApiClient *)sharedClient {
    static AFGoPartyApiClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFGoPartyApiClient alloc] initWithBaseURL:[NSURL URLWithString:kAFTwitterAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
