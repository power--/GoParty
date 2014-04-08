//
//  GlobalTokenManager.m
//  GoParty
//
//  Created by JoeTang on 14-3-12.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "GlobalTokenManager.h"

NSString * const userModelNotification = @"com.goparty.user.loaded";

@implementation GlobalTokenManager

+(GlobalTokenManager *)sharedInstance{
    static GlobalTokenManager *sharedTokenManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTokenManager = [[self alloc] init];
    });
    return sharedTokenManager;
}

-(void) setUpCurrentUserData:(UserModel *)user{
    
}

-(void) setUser: (UserModel *)user{
    [[NSNotificationCenter defaultCenter] postNotificationName:userModelNotification object:user userInfo:nil];
}

@end
