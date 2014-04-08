//
//  UserFriendGroupModel.m
//  GoParty
//
//  Created by JoeTang on 14-4-9.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "UserFriendGroupModel.h"

@implementation UserFriendGroupModel

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"groupId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+(void)addNewFriendGroup:(NSString *)groupName callback:(void(^)(UserFriendGroupModel *, ErrorModel *error))block{}

+(void)updateFriendGroup:(NSString *)groupId name:(NSString *)groupName callback:(void(^)(UserFriendGroupModel *, ErrorModel *error))block{}

+(void) deleteFriendGroup:(NSString *)groupId callback:(void(^)(ErrorModel *error))block{}

@end
