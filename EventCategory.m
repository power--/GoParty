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
    [[AFGoPartyApiClient sharedClient] getPath:[NSString stringWithFormat:@"%@",@"/cxf/rest/eventcategories"] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        NSMutableArray *mutableEvents = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON) {
            EventCategory *event = [[EventCategory alloc] initWithDictionary:attributes];
            [mutableEvents addObject:event];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableEvents], err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block([NSArray array], err);
        }
    }];
}

@end
