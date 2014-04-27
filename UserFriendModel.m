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
#import "UserFriendGroupModel.h"

@implementation UserFriendModel

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"userId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+(Class)groups_class{
    return [UserFriendGroupModel class];
}

+(void) addFriend:(NSString *)userId message:(NSString *)applyMessage callback:(void(^)(UserFriendModel *friend, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] postPathExt:[NSString stringWithFormat:@"friends/%@",userId] parameters:[NSDictionary dictionaryWithObjectsAndKeys:applyMessage,@"message",nil] success:^(AFHTTPRequestOperation *operation, id JSON) {
        UserFriendModel *friend = [[UserFriendModel alloc] initWithDictionary:JSON];
        if (block) {
            block(friend,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil,error);
        }
    }];
}

+(void) getFriendsList:(void(^)(NSArray *friends, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPathExt:@"friends" parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *friendsList = [NSMutableArray arrayWithCapacity:[responseObject count]];
        for (NSDictionary *atts in friendsList) {
            UserFriendModel *friend = [[UserFriendModel alloc] initWithDictionary:atts];
            [friendsList addObject:friend];
        }
        if (block) {
            block(friendsList,nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil,error);
        }
    }];
}

+(void) updateFriendInfo:(NSString *)userId friend:(UserFriendModel *)targetFriend callback:(void(^)(UserFriendModel *friends, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"friends/%@",userId] parameters:[targetFriend toDictionary] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        UserFriendModel *friend = [[UserFriendModel alloc] initWithDictionary:responseObject];
        if (block) {
            block(friend,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil,error);
        }
    }];
}

+(void) deleteFriend:(NSString *)userId callback:(void(^)(ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] deletePathExt:[NSString stringWithFormat:@"friends/%@",userId] parameters:[[NSDictionary alloc] init ] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(error);
        }
    }];
}

@end
