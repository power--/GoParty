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

@synthesize userId,eventId,content,messageId,publishTime,type;

+(void) PostMessage:(NSInteger)eventId message:(NSString *)content callBackBlock:(void(^)(EventMessage *msg,ErrorModel *err))block{
    [[AFGoPartyApiClient sharedClient] postPath:[NSString stringWithFormat:@"/events/%dl/messages",eventId] parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"content",content, nil] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        EventMessage *msg = [[EventMessage alloc] initWithDictionary:JSON];
        
        if (block) {
            block(msg, err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(nil, err);
        }
    }];
}

@end
