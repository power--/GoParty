//
//  EventModel.h
//  GoParty
//
//  Created by JoeTang on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;

typedef NS_ENUM(NSInteger, EventOperation) {
    CREATE = 0,
    EDIT = 1,
    DELETE = 2
};

@interface EventModel : NSObject

@property(nonatomic,copy)NSMutableArray *_attendees;
@property(nonatomic,copy)NSString *_description;
@property(nonatomic,copy)NSDate *_endtime;
@property(nonatomic,copy)NSDate *_startime;
@property(nonatomic,copy)NSString *_eventId;
@property(nonatomic,copy)NSString *_eventName;
@property(nonatomic,copy)UserModel *_owner;
@property(nonatomic,copy)NSString *_status;
@property(nonatomic,copy)NSString *_title;


- (id) iniWithAtrributes:(NSDictionary *)attributes;
+ (void) QuerySingleEvent:(NSString *)eventIdentifier callBackBlock:(void (^)(UserModel *user, NSError *error))block;
+ (void) QueryUserEvents:(NSInteger *)userId callBackBlock:(void (^)(NSArray *events, NSError *error))block;
+ (void) HandleSingleEvent:(EventOperation *)operation event:(EventModel *)eventModel;

@end
