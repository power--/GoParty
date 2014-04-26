//
//  EventMemberModel.h
//  GoParty
//
//  Created by JoeTang on 14-4-26.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "Jastor.h"

@interface EventMemberModel : Jastor

@property(nonatomic,strong) NSString *userId;
@property(nonatomic)bool admin;
@property(nonatomic,strong) NSString *nickName;
@property(nonatomic, strong) NSDate *birthdate;
@property(nonatomic,strong)NSString *photo;
@property(nonatomic, strong) NSString *participance;

@end
