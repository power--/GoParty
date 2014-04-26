//
//  UserFriendModel.h
//  GoParty
//
//  Created by JoeTang on 14-4-8.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "Jastor.h"

@interface UserFriendModel : Jastor

@property(nonatomic,strong) NSString *userId;
@property(nonatomic) NSInteger phone;
@property(nonatomic) NSInteger qq;
@property(nonatomic, strong) NSString *loginId;
@property(nonatomic, strong) NSString *nickName;
@property(nonatomic, strong) NSString *password;
@property(nonatomic, strong) NSString *photo;
@property(nonatomic, strong) NSString *signature;
@property(nonatomic, strong) NSString *weChat;
@property(nonatomic, strong) NSString *weibo;
@property(nonatomic, strong) NSString *birthdate;
@property(nonatomic, strong) NSString *gender;
@property(nonatomic, strong) NSString *token;
@property(nonatomic, strong) NSString *location;
@property(nonatomic,strong) NSString *remarkName;
@property(nonatomic,strong) NSArray *groups;

+(void) addFriend:(NSString *)userId message:(NSString *)applyMessage callback:(void(^)(UserFriendModel *friend, ErrorModel *error))block;
+(void) getFriendsList:(void(^)(NSArray *friends, ErrorModel *error))block;

+(void) updateFriendInfo:(NSString *)userId callback:(void(^)(UserFriendModel *friends, ErrorModel *error))block;

+(void) deleteFriend:(NSString *)userId callback:(void(^)(ErrorModel *error))block;

@end
