//
//  UserModel.h
//  GoParty
//
//  Created by JoeTang on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@class ErrorModel;
@interface UserModel : Jastor

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
@property(nonatomic) BOOL admin;
@property(nonatomic, strong) NSString *participance;


+ (void)Login:(NSString *)openId usertoken:(NSString *) tokenId usersession:(NSString *)sessionId usermobile:(NSString *)mobile callbackblock:(void(^)(UserModel *user, ErrorModel *error))block;
+ (void)LogOut:(void(^)(ErrorModel *error))block;
+ (void)RegisterUser:(UserModel *)user callbackblock:(void(^)(UserModel *user, ErrorModel *error))block;
+ (void)FindUser:(NSString *)userId callbackblock:(void(^)(UserModel *user, ErrorModel *error))block;
+ (void)GetCurrentUserProfile:(void(^)(UserModel *user, ErrorModel *error))block;

@end
