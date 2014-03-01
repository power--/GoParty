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

NSString * const EventsResourcesUrl = @"";

@implementation EventModel{
    NSMutableArray *attendees;
    NSString *description;
    NSDate *endtime;
    NSDate *startime;
    NSString *eventId;
    NSString *eventName;
    UserModel *owner;
    NSString *status;
    NSString *title;
}

@synthesize _attendees = attendees;
@synthesize _description = description;
@synthesize _endtime = endtime;
@synthesize _eventId = eventId;
@synthesize _eventName = eventName;
@synthesize _owner = owner;
@synthesize _startime = startime;
@synthesize _status = status;
@synthesize _title = title;

- (id) iniWithAtrributes:(NSDictionary *)attributes{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    description = [attributes valueForKeyPath:@"description"];
    endtime = [attributes valueForKeyPath:@"endtime"];
    startime = [attributes valueForKeyPath:@"endtime"];
    eventId = [attributes valueForKeyPath:@"eventCategory.id"];
    eventName = [attributes valueForKeyPath:@"eventCategory.name"];
    status = [attributes valueForKeyPath:@"status"];
    title = [attributes valueForKey:@"title"];
    owner = [[UserModel alloc] initWithAttributes:[attributes valueForKeyPath:@"owner"]];
    NSArray *userArray = [attributes objectForKey:@"attendees.attendees"];
    attendees = [NSMutableArray arrayWithCapacity:[userArray count]];
    [userArray enumerateObjectsUsingBlock:^(id obj,NSUInteger idx, BOOL *stop){
        UserModel *user = [[UserModel alloc] initWithAttributes:obj];
        [attendees addObject:user];
    }];

    return self;
}
+ (void) QuerySingleEvent:(NSString *)eventIdentifier callBackBlock:(void (^)(UserModel *user, NSError *error))block{}

+ (void) QueryUserEvents:(NSInteger *)userId callBackBlock:(void (^)(NSArray *events, NSError *error))block{
    [[AFGoPartyApiClient sharedClient] getPath:[NSString stringWithFormat:@"%@%ld",@"/cxf/rest/event/", (long)userId] parameters:[NSDictionary dictionaryWithObject:@"false" forKey:@"include_entities"] success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableEvents = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON) {
            EventModel *event = [[EventModel alloc] iniWithAtrributes:attributes];
            [mutableEvents addObject:event];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableEvents], nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}
+ (void) HandleSingleEvent:(EventOperation *)operation event:(EventModel *)eventModel{}


@end
