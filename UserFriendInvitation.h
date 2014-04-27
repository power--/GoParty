//
//  UserFriendInvitation.h
//  GoParty
//
//  Created by JoeTang on 14-4-27.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "Jastor.h"
#import "UserModel.h"

@interface UserFriendInvitation : Jastor

@property(nonatomic,copy) NSString *invitationId;
@property(nonatomic,copy) UserModel *inviter;
@property(nonatomic,copy) NSString *inviterMessage;
@property(nonatomic,copy) NSString *status;
@property(nonatomic) NSTimeInterval updateTime;

@end
