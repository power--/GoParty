//
//  EventMemberModel.m
//  GoParty
//
//  Created by JoeTang on 14-4-26.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "EventMemberModel.h"

@implementation EventMemberModel

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"userId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

@end
