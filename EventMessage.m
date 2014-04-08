//
//  EventMessage.m
//  GoParty
//
//  Created by JoeTang on 14-3-17.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "EventMessage.h"
#import "AFGoPartyApiClient.h"
#import "ErrorModel.h"

@implementation EventMessage

//@synthesize userId,eventId,content,messageId,publishTime,type;

+(void) PostMessage:(NSInteger)eventId message:(NSString *)content callBackBlock:(void(^)(EventMessage *msg,ErrorModel *err))block{
    [[AFGoPartyApiClient sharedClient] postPathExt:[NSString stringWithFormat:@"events/%dl/messages",eventId] parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"content",content, nil] success:^(AFHTTPRequestOperation *operation, id JSON) {
        EventMessage *msg = [[EventMessage alloc] initWithDictionary:JSON];
        
        if (block) {
            block(msg, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
