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

NSString * const EventsResourcesUrl = @"";

@implementation EventModel

@synthesize attendees,status,startime,description,endtime,eventCategory,location,locationShareable,owner,title,visibility,eventId;

+ (Class)attendees_class {
    return [UserModel class];
}

- (NSDictionary *)map{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[super map]];
    [map setObject:@"id" forKey:@"eventId"];
    return [NSDictionary dictionaryWithDictionary:map];
}

+ (void) QuerySingleEvent:(NSInteger)eventIdentifier callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPath:[NSString stringWithFormat:@"%@%dl",@"/events/", eventIdentifier] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        EventModel *event = [[EventModel alloc] initWithDictionary:JSON];
        
        
        if (block) {
            block(event, err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(nil, err);
        }
    }];
}

+ (void) QueryUserEvents:(NSInteger *)userId queryFilters:(EventQueryFilters *)filters callBackBlock:(void (^)(NSArray *events, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPath:[NSString stringWithFormat:@"%@%ld",@"/events/", (long)userId] parameters:[filters GetQueryString] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        NSMutableArray *mutableEvents = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON) {
            EventModel *event = [[EventModel alloc] initWithDictionary:attributes];
            [mutableEvents addObject:event];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableEvents], err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(nil, err);
        }
    }];
}
+ (void) UpdateEvent:(EventModel *)eventModel callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] putPath:[NSString stringWithFormat:@"%@%dl",@"/events/", eventModel.eventId] parameters:[eventModel toDictionary] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        EventModel *event = [[EventModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(event, err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(nil, err);
        }
    }];
}

+ (void) CreateEvent:(EventModel *)event callBackBlock:(void (^)(EventModel *eve, ErrorModel *err))block{
    [[AFGoPartyApiClient sharedClient] postPath:[NSString stringWithFormat:@"%@",@"/events"] parameters:[event toDictionary] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        EventModel *event = [[EventModel alloc] initWithDictionary:JSON];
        
        
        if (block) {
            block(event, err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(nil, err);
        }
    }];
}
+ (void) CancelEvent:(NSInteger)envId callBackBlock:(void (^)(ErrorModel *err))block{
    [[AFGoPartyApiClient sharedClient] deletePath:[NSString stringWithFormat:@"%@%dl",@"/events/", envId] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(err);
        }
    }];
}
+ (void) InviteAttendee:(EventModel *)event attendee:(UserModel *)atte callBackBlock:(void (^)(EventModel *model, ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPath:[NSString stringWithFormat:@"/events/%dl/invitees/%dl",event.eventId, atte.userId] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        EventModel *event = [[EventModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(event, err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(nil, err);
        }
    }];
}
+ (void) RemoveAttendee:(NSInteger)event attendee:(NSInteger)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] deletePath:[NSString stringWithFormat:@"/events/%dl/invitees/%dl",event, atte] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(err);
        }
    }];
}
+ (void) AssignSponsor:(NSInteger)event attendee:(NSInteger)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPath:[NSString stringWithFormat:@"/events/%dl/sponsors/%dl",event, atte] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(err);
        }
    }];
}
+ (void) UpdateParticipationStatus:(NSInteger)event callBackBlock:(void (^)(ErrorModel *ErrorModel))block{
    [[AFGoPartyApiClient sharedClient] putPath:[NSString stringWithFormat:@"/events/%dl/participance",event] parameters:[[NSDictionary alloc] init] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        
        if (block) {
            block(err);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            block(err);
        }
    }];
}
+ (void) QueryCurrentUserEvents:(EventQueryFilters *)filters callBackBlock:(void (^)(NSArray *events, ErrorModel *error))block{
    [[AFGoPartyApiClient sharedClient] getPath:[NSString stringWithFormat:@"%@",@"/myevents"] parameters:[filters GetQueryString] success:^(AFHTTPRequestOperation *operation, id JSON) {
        ErrorModel *err = [[ErrorModel alloc] initWithDictionary:JSON];
        NSMutableArray *mutableEvents = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON) {
            EventModel *event = [[EventModel alloc] initWithDictionary:attributes];
            [mutableEvents addObject:event];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableEvents], err);
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
