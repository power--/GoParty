//
//  UserFriendModel.m
//  GoParty
//
//  Created by JoeTang on 14-4-8.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "UserFriendModel.h"
#import "UserModel.h"

@implementation UserFriendModel

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"userId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+(void) addFriend:(NSString *)userId message:(NSString *)applyMessage callback:(void(^)(UserFriendModel *friend, ErrorModel *error))block{}
+(void) getFriendsList:(void(^)(NSArray *friends))block{}

+(void) updateFriendInfo{}

+(void) deleteFriend{}

@end
