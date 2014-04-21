//
//  GlobalTokenManager.m
//  GoParty
//
//  Created by JoeTang on 14-3-12.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "GlobalTokenManager.h"
#import "UserModel.h"

NSString * const userModelNotification = @"com.goparty.user.loaded";

@implementation GlobalTokenManager
{
    UserModel *_currentUser;
}

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
    _currentUser = user;
    [[NSNotificationCenter defaultCenter] postNotificationName:userModelNotification object:user userInfo:nil];
}

-(UserModel *)getUser{
    if (!_currentUser) {
        _currentUser = [[UserModel alloc] init];
    }
    return _currentUser;
}

@end
