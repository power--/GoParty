//
//  EventModel.h
//  GoParty
//
//  Created by JoeTang on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
#import "EventQueryFilters.h"
@class EventCategory;
@class EventMemberModel;
@class ErrorModel;

typedef NS_ENUM(NSInteger, EventOperation) {
    CREATE = 0,
    EDIT = 1,
    DELETE = 2
};

typedef NS_ENUM(NSInteger, EventStatus) {
    INIT = 0,
    TODO = 1,
    DOING = 2,
    DONE = 3
};

typedef NS_ENUM(NSInteger, EventVisibility) {
    V_PUBLIC = 0,
    V_FRIEND = 1,
    V_PRIVATE = 2
};

@interface EventModel : Jastor

@property(nonatomic, strong)NSString *eventId;
@property(nonatomic,strong)NSMutableArray *members;
@property(nonatomic,strong)NSString *description;
@property(nonatomic,strong)NSString *endTime;
@property(nonatomic,strong)NSString *startTime;
@property(nonatomic,strong)EventMemberModel *owner;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *location;
@property(nonatomic,strong)NSMutableArray *categories;
@property(nonatomic,strong)NSString *visibility;
@property(nonatomic)bool locationShareable;


+ (void) QuerySingleEvent:(NSString *)eventIdentifier callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block;
+ (void) QueryUserEvents:(NSString *)userId queryFilters:(EventQueryFilters *)filters callBackBlock:(void (^)(NSArray *events, ErrorModel *error))block;
+ (void) QueryCurrentUserEvents:(EventQueryFilters *)filters callBackBlock:(void (^)(NSArray *events, ErrorModel *error))block;
+ (void) UpdateEvent:(EventModel *)eventModel callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block;
+ (void) CreateEvent:(EventModel *)event callBackBlock:(void (^)(EventModel *eve, ErrorModel *err))block;
+ (void) CancelEvent:(NSString *)envetId callBackBlock:(void (^)(ErrorModel *err))block;
+ (void) InviteAttendee:(EventModel *)event attendee:(NSMutableArray *)atte callBackBlock:(void (^)(EventModel *model,ErrorModel *ErrorModel))block;
+ (void) RemoveAttendee:(NSString *)event attendee:(NSString *)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block;
+ (void) AssignSponsor:(NSString *)event attendee:(NSString *)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block;
+ (void) UpdateParticipationStatus:(NSString *)eventId callBackBlock:(void (^)(ErrorModel *ErrorModel))block;
@end
