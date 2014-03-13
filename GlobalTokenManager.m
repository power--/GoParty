//
//  GlobalTokenManager.m
//  GoParty
//
//  Created by JoeTang on 14-3-12.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "GlobalTokenManager.h"

@implementation GlobalTokenManager

+(GlobalTokenManager *)sharedInstance{
    static GlobalTokenManager *sharedTokenManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTokenManager = [[self alloc] init];
    });
    return sharedTokenManager;
}

@end
