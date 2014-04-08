//
//  EventCategory.m
//  GoParty
//
//  Created by JoeTang on 14-3-13.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "EventCategory.h"
#import "AFGoPartyApiClient.h"
#import "ErrorModel.h"

@implementation EventCategory

//@synthesize name, categoryId;

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"categoryId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+(void)QueryAllEventCategories:(void(^)(NSArray *categories, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPathExt:[NSString stringWithFormat:@"%@",@"eventcategories"] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableEvents = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON) {
            EventCategory *event = [[EventCategory alloc] initWithDictionary:attributes];
            [mutableEvents addObject:event];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableEvents], nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(nil, error);
        }
    }];
}

@end
