//
//  EventMessage.h
//  GoParty
//
//  Created by JoeTang on 14-3-17.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorModel.h"
#import "Jastor.h"

@interface EventMessage : Jastor

@property(nonatomic,strong) NSString *content;
@property(nonatomic) NSInteger eventId;
@property(nonatomic,strong) NSString *publishTime;
@property(nonatomic) NSInteger messageId;
@property(nonatomic,strong)NSString *type;
@property(nonatomic) NSInteger userId;

+(void) PostMessage:(NSInteger)eventId message:(NSString *)content callBackBlock:(void(^)(EventMessage *msg,ErrorModel *err))block;

@end
