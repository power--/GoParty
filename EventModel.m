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

NSString * const EventsResourcesUrl = @"";

@implementation EventModel

-(UserModel *)owner{
    if(!_owner)_owner = [[UserModel alloc] init];
    return _owner;
}

-(EventCategory *)eventCategory{
    if(!_eventCategory)_eventCategory = [[EventCategory alloc] init];
    return _eventCategory;
}

+ (Class)attendees_class {
    return [UserModel class];
}

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"eventId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+ (void) QuerySingleEvent:(NSInteger)eventIdentifier callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPathExt:[NSString stringWithFormat:@"%@%dl",@"events/", eventIdentifier] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
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
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"%@%dl",@"events/", eventModel.eventId] parameters:[eventModel toDictionary] success:^(AFHTTPRequestOperation *operation, id JSON) {
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
+ (void) CancelEvent:(NSInteger)envId callBackBlock:(void (^)(ErrorModel *err))block{
    [[AFGoPartyApiClient sharedClient] deletePathExt:[NSString stringWithFormat:@"%@%dl",@"events/", envId] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
           
            block(error);
        }
    }];
}
+ (void) InviteAttendee:(EventModel *)event attendee:(UserModel *)atte callBackBlock:(void (^)(EventModel *model, ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"events/%dl/invitees/%@",event.eventId, atte.userId] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
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
+ (void) RemoveAttendee:(NSInteger)event attendee:(NSString *)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] deletePathExt:[NSString stringWithFormat:@"events/%dl/invitees/%@",event, atte] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(error);
        }
    }];
}
+ (void) AssignSponsor:(NSInteger)event attendee:(NSString *)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"events/%dl/sponsors/%@",event, atte] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        if (block) {
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, ErrorModel *error) {
        if (block) {
            
            block(error);
        }
    }];
}
+ (void) UpdateParticipationStatus:(NSInteger)event callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPathExt:[NSString stringWithFormat:@"events/%dl/participance",event] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        
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
