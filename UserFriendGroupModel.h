//
//  UserFriendGroupModel.h
//  GoParty
//
//  Created by JoeTang on 14-4-9.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorModel.h"
#import "Jastor.h"

@interface UserFriendGroupModel : Jastor

@property(nonatomic,strong)NSString *groupId;
@property(nonatomic,strong)NSString *name;

+(void)addNewFriendGroup:(NSString *)groupName callback:(void(^)(UserFriendGroupModel *, ErrorModel *error))block;

+(void)updateFriendGroup:(NSString *)groupId name:(NSString *)groupName callback:(void(^)(UserFriendGroupModel *, ErrorModel *error))block;

+(void) deleteFriendGroup:(NSString *)groupId callback:(void(^)(ErrorModel *error))block;

@end
