//
//  UserFriendModel.m
//  GoParty
//
//  Created by JoeTang on 14-4-8.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "UserFriendModel.h"
#import "UserModel.h"
#import "GoPartyUtilities.h"
#import "AFGoPartyApiClient.h"

@implementation UserFriendModel

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"userId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+(void) addFriend:(NSString *)userId message:(NSString *)applyMessage callback:(void(^)(UserFriendModel *friend, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] postPathExt:[NSString stringWithFormat:@"friends/%@",userId] parameters:[NSDictionary dictionaryWithObjectsAndKeys:applyMessage,@"message",nil] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        if (block) {
            block(nil,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil,error);
        }
    }];
}
+(void) getFriendsList:(void(^)(NSArray *friends, ErrorModel *error))block{}

+(void) updateFriendInfo:(NSString *)userId callback:(void(^)(UserFriendModel *friends, ErrorModel *error))block{}

+(void) deleteFriend:(NSString *)userId callback:(void(^)(ErrorModel *error))block{}

@end
