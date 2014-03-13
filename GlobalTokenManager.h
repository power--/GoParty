//
//  GlobalTokenManager.h
//  GoParty
//
//  Created by JoeTang on 14-3-12.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;

@interface GlobalTokenManager : NSObject

+(GlobalTokenManager *)sharedInstance;

@property(nonatomic, copy) UserModel *currentUser;

@end
