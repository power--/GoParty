//
//  UserFriendGroupModel.m
//  GoParty
//
//  Created by JoeTang on 14-4-9.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "UserFriendGroupModel.h"
#import "GoPartyUtilities.h"
#import "AFGoPartyApiClient.h"
#import "UserFriendGroupModel.h"

@implementation UserFriendGroupModel

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"groupId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+(void)addNewFriendGroup:(NSString *)groupName callback:(void(^)(UserFriendGroupModel *, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] postPathExt:@"/friends/groups" parameters:[NSDictionary dictionaryWithObjectsAndKeys:groupName,@"name", nil] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        UserFriendGroupModel *group = [[UserFriendGroupModel alloc] initWithDictionary:responseObject];
        if (block) {
            block(group, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+(void)updateFriendGroup:(NSString *)groupId name:(NSString *)groupName callback:(void(^)(UserFriendGroupModel *, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"/friends/groups/%@", groupId] parameters:[NSDictionary dictionaryWithObjectsAndKeys:groupName,@"name", nil] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        UserFriendGroupModel *group = [[UserFriendGroupModel alloc] initWithDictionary:responseObject];
        if (block) {
            block(group, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+(void) deleteFriendGroup:(NSString *)groupId callback:(void(^)(ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] deletePathExt:[NSString stringWithFormat:@"/friends/groups/%@", groupId] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
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
