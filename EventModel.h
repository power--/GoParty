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
@class UserModel;
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

@property(nonatomic)NSInteger eventId;
@property(nonatomic,strong)NSArray *attendees;
@property(nonatomic,strong)NSArray *refusedAttendees;
@property(nonatomic,strong)NSString *description;
@property(nonatomic,strong)NSDate *endtime;
@property(nonatomic,strong)NSDate *startime;
@property(nonatomic,strong)UserModel *owner;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *location;
@property(nonatomic,strong)EventCategory *eventCategory;
@property(nonatomic,strong)NSString *visibility;
@property(nonatomic)BOOL locationShareable;


+ (void) QuerySingleEvent:(NSInteger)eventIdentifier callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block;
+ (void) QueryUserEvents:(NSInteger *)userId queryFilters:(EventQueryFilters *)filters callBackBlock:(void (^)(NSArray *events, ErrorModel *error))block;
+ (void) QueryCurrentUserEvents:(EventQueryFilters *)filters callBackBlock:(void (^)(NSArray *events, ErrorModel *error))block;
+ (void) UpdateEvent:(EventModel *)eventModel callBackBlock:(void (^)(EventModel *user, ErrorModel *error))block;
+ (void) CreateEvent:(EventModel *)event callBackBlock:(void (^)(EventModel *eve, ErrorModel *err))block;
+ (void) CancelEvent:(NSInteger)envetId callBackBlock:(void (^)(ErrorModel *err))block;
+ (void) InviteAttendee:(EventModel *)event attendee:(UserModel *)atte callBackBlock:(void (^)(EventModel *model,ErrorModel *ErrorModel))block;
+ (void) RemoveAttendee:(NSInteger)event attendee:(NSInteger)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block;
+ (void) AssignSponsor:(NSInteger)event attendee:(NSInteger)atte callBackBlock:(void (^)(ErrorModel *ErrorModel))block;
+ (void) UpdateParticipationStatus:(NSInteger)eventId callBackBlock:(void (^)(ErrorModel *ErrorModel))block;
@end
