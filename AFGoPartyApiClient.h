//
//  AFGoPartyApiClient.h
//  GoParty
//
//  Created by JoeTang on 14-3-2.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface AFGoPartyApiClient : AFHTTPClient

+ (AFGoPartyApiClient *)sharedClient;

@end
