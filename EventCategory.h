//
//  EventCategory.h
//  GoParty
//
//  Created by JoeTang on 14-3-13.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
@class ErrorModel;

@interface EventCategory : Jastor

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *categoryId;
@property(nonatomic,strong) NSString *logo;

+(void)QueryAllEventCategories:(void(^)(NSArray *categories, ErrorModel *error))block;

@end
