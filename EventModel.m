//
//  EventModel.m
//  GoParty
//
//  Created by JoeTang on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "UserModel.h"
#import "EventModel.h"
#import "AFGoPartyApiClient.h"
#import "ErrorModel.h"
#import "EventCategory.h"
#import "EventMemberModel.h"

NSString * const EventsResourcesUrl = @"";

@implementation EventModel

-(EventMemberModel *)owner{
    if(!_owner)_owner = [[EventMemberModel alloc] init];
    return _owner;
}

-(NSMutableArray *)members{
    if (!_members) {
        _members = [[NSMutableArray alloc] init];
    }
    
    return _members;
}

-(NSMutableArray *)categories{
    if(!_categories)_categories = [[NSMutableArray alloc] init];
    return _categories;
}

+ (Class)members_class {
    return [EventMemberModel class];
}

+(Class)categories_class{
    return [EventCategory class];
}

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"eventId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+ (void) QuerySingleEvent:(NSString *)eventIdentifier callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPathExt:[NSString stringWithFormat:@"%@%@",@"events/", eventIdentifier] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        EventModel *event = [[EventModel alloc] initWithDictionary:JSON];
        if (block) {
            block(event, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void) QueryUserEvents:(NSString *)userId queryFilters:(EventQueryFilters *)filters callBackBlock:(void (^)(NSArray *events, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPathExt:[NSString stringWithFormat:@"%@%@",@"events/", userId] parameters:[filters GetQueryString] success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableEvents = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON) {
            EventModel *event = [[EventModel alloc] initWithDictionary:attributes];
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
+ (void) UpdateEvent:(EventModel *)eventModel callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"%@%@",@"events/", eventModel.eventId] parameters:[eventModel toDictionary] success:^(AFHTTPRequestOperation *operation, id JSON) {
        EventModel *event = [[EventModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(event, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(nil, error);
        }
    }];
}

+ (void) CreateEvent:(EventModel *)event callBackBlock:(void (^)(EventModel *eve, ErrorModel *err))block{
    [[AFGoPartyApiClient sharedClient] postPathExt:[NSString stringWithFormat:@"%@",@"events"] parameters:[event toDictionary] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        EventModel *event = [[EventModel alloc] initWithDictionary:JSON];
        
        
        if (block) {
            block(event, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(nil, error);
        }
    }];
}
+ (void) CancelEvent:(NSString *)envId callBackBlock:(void (^)(ErrorModel *err))block{
    [[AFGoPartyApiClient sharedClient] deletePathExt:[NSString stringWithFormat:@"%@%@",@"events/", envId] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
           
            block(error);
        }
    }];
}
+ (void) InviteAttendee:(EventModel *)event attendee:(NSMutableArray *)atte callBackBlock:(void (^)(EventModel *model, ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"events/%@/invitees/%@",event.eventId, [atte componentsJoinedByString:@";"]] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        EventModel *event = [[EventModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(event, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(nil, error);
        }
    }];
}
+ (void) RemoveAttendee:(NSString *)event attendee:(NSString *)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] deletePathExt:[NSString stringWithFormat:@"events/%@/invitees/%@",event, atte] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(error);
        }
    }];
}
+ (void) AssignSponsor:(NSString *)event attendee:(NSString *)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"events/%@/sponsors/%@",event, atte] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(error);
        }
    }];
}
+ (void) UpdateParticipationStatus:(NSString *)event callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"events/%@/participance",event] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(error);
        }
    }];
}
+ (void) QueryCurrentUserEvents:(EventQueryFilters *)filters callBackBlock:(void (^)(NSArray *events, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPathExt:[NSString stringWithFormat:@"%@",@"events"] parameters:[filters GetQueryString] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        NSMutableArray *mutableEvents = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON) {
            EventModel *event = [[EventModel alloc] initWithDictionary:attributes];
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
