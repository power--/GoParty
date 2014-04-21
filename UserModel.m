//
//  UserModel.m
//  GoParty
//
//  Created by JoeTang on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "UserModel.h"
#import "AFGoPartyApiClient.h"
#import "ErrorModel.h"
#import "GoPartyUtilities.h"
#import "AFHTTPRequestOperation.h"
#import "GlobalTokenManager.h"

@implementation UserModel

//@synthesize userId,signature,token,nikeName,birthdate,qq,phone,password,photo,gender,location,loginId,weChat,weibo;

//- (id)initWithAttributes:(NSDictionary *)attributes{
//
//    self = [super init];
//    if (!self) {
//        return nil;
//    }
//    
//    
//    /*
//     @property(readonly) NSInteger userId;
//     @property(nonatomic) NSInteger phone;
//     @property(nonatomic) NSInteger qq;
//     @property(nonatomic, strong) NSString *loginId;
//     @property(nonatomic, strong) NSString *nikeName;
//     @property(nonatomic, strong) NSString *password;
//     @property(nonatomic, strong) NSString *photo;
//     @property(nonatomic, strong) NSString *signature;
//     @property(nonatomic, strong) NSString *weChat;
//     @property(nonatomic, strong) NSString *weibo;
//     @property(nonatomic, strong) NSString *birthdate;
//     @property(nonatomic, strong) NSString *gender;
//     @property(readonly) NSString *token;
//     @property(nonatomic, strong) NSString *location;
//     
//     */
//    
//    _userId = [[attributes valueForKeyPath:@"id"] integerValue];
//    _token = [attributes valueForKeyPath:@"token"];
//    self.nikeName = [attributes valueForKeyPath:@"nickName"];
//    self.loginId = [attributes valueForKeyPath:@"loginId"];
//    self.password = [attributes valueForKeyPath:@"password"];
//    self.photo = [attributes valueForKeyPath:@"photo"];
//    self.signature = [attributes valueForKeyPath:@"signature"];
//    self.weChat = [attributes valueForKeyPath:@"weChat"];
//    self.weibo = [attributes valueForKeyPath:@"weibo"];
//    self.gender = [attributes valueForKeyPath:@"gender"];
//    self.location = [attributes valueForKeyPath:@"location"];
//    self.phone = [[attributes valueForKeyPath:@"phone"] integerValue];
//    self.qq = [[attributes valueForKeyPath:@"qq"] integerValue];
//    
//    return self;
//}

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"userId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+ (void)Login:(NSString *)openId usertoken:(NSString *) tokenId usersession:(NSString *)sessionId usermobile:(NSString *)mobile callbackblock:(void(^)(UserModel *user, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] postPathExt:[NSString stringWithFormat:@"%@",@"login"] parameters:[NSDictionary dictionaryWithObjectsAndKeys:openId,@"openId",tokenId,@"tokenId",sessionId,@"sessionId",mobile,@"mobile", nil] success:^(AFHTTPRequestOperation *operation, id JSON) {
        UserModel *user = [[UserModel alloc] initWithDictionary:JSON];
        user.token = [operation.response.allHeaderFields objectForKey:@"token"];
        [GlobalTokenManager sharedInstance].currentUser = user;
        if (block) {
            
            block(user, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil, error);
        }
    }];
}
+ (void)LogOut:(void(^)(ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"%@",@"logout"] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(error);
        }
    }];
}
+ (void)RegisterUser:(UserModel *)user callbackblock:(void(^)(UserModel *user, ErrorModel *error))block{
    NSDictionary *userPoroerties = [GoPartyUtilities GetDicFromNormalClass:user];
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"%@",@"profile"] parameters:userPoroerties success:^(AFHTTPRequestOperation *operation, id JSON) {
        UserModel *user = [[UserModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(user, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil, error);
        }
    }];
}
+ (void)FindUser:(NSString *)userId callbackblock:(void(^)(UserModel *user, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPathExt:[NSString stringWithFormat:@"%@%@",@"users/",userId] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        UserModel *user = [[UserModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(user, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+(void)GetCurrentUserProfile:(void(^)(UserModel *user, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPathExt:[NSString stringWithFormat:@"%@",@"profile"] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        UserModel *user = [[UserModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(user, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
