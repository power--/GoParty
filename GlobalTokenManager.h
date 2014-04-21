//
//  GlobalTokenManager.h
//  GoParty
//
//  Created by JoeTang on 14-3-12.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;

extern NSString * const userModelNotification;

@interface GlobalTokenManager : NSObject

+(GlobalTokenManager *)sharedInstance;

-(void) setUpCurrentUserData:(UserModel *)user;

@property(nonatomic, strong, setter = setUser:, getter = getUser) UserModel *currentUser;

-(void) setUser: (UserModel *)user;
-(UserModel *)getUser;

@end
