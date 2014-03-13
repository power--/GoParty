//
//  UserModel.m
//  GoParty
//
//  Created by JoeTang on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

@synthesize userId = _userId;
@synthesize token = _token;

- (id)initWithAttributes:(NSDictionary *)attributes{

    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    /*
     @property(readonly) NSInteger userId;
     @property(nonatomic) NSInteger phone;
     @property(nonatomic) NSInteger qq;
     @property(nonatomic, strong) NSString *loginId;
     @property(nonatomic, strong) NSString *nikeName;
     @property(nonatomic, strong) NSString *password;
     @property(nonatomic, strong) NSString *photo;
     @property(nonatomic, strong) NSString *signature;
     @property(nonatomic, strong) NSString *weChat;
     @property(nonatomic, strong) NSString *weibo;
     @property(nonatomic, strong) NSString *birthdate;
     @property(nonatomic, strong) NSString *gender;
     @property(readonly) NSString *token;
     @property(nonatomic, strong) NSString *location;
     
     */
    
    _userId = [[attributes valueForKeyPath:@"id"] integerValue];
    _token = [attributes valueForKeyPath:@"token"];
    self.nikeName = [attributes valueForKeyPath:@"nickName"];
    self.loginId = [attributes valueForKeyPath:@"loginId"];
    self.password = [attributes valueForKeyPath:@"password"];
    self.photo = [attributes valueForKeyPath:@"photo"];
    self.signature = [attributes valueForKeyPath:@"signature"];
    self.weChat = [attributes valueForKeyPath:@"weChat"];
    self.weibo = [attributes valueForKeyPath:@"weibo"];
    self.gender = [attributes valueForKeyPath:@"gender"];
    self.location = [attributes valueForKeyPath:@"location"];
    self.phone = [[attributes valueForKeyPath:@"phone"] integerValue];
    self.qq = [[attributes valueForKeyPath:@"qq"] integerValue];
    
    return self;
}

+ (void)Login:(NSString *)openId usertoken:(NSString *) tokenId usersession:(NSString *)sessionId usermobile:(NSString *)mobile callbackblock:(void(^)(UserModel *user, ErrorModel *error))block{}
+ (void)LogOut:(void(^)(ErrorModel *error))block{}
+ (void)RegisterUser:(UserModel *)user callbackblock:(void(^)(UserModel *user, ErrorModel *error))block{}
+ (void)FindUser:(NSInteger)userId callbackblock:(void(^)(UserModel *user, ErrorModel *error))block{}

@end
