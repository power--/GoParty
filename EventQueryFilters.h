//
//  EventQueryFilters.h
//  GoParty
//
//  Created by JoeTang on 14-3-17.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventQueryFilters : NSObject
@property(nonatomic,strong) NSString *scope;
@property(nonatomic,strong) NSString *after;
@property(nonatomic,strong) NSString *before;
@property(nonatomic,strong) NSArray *sponsors;
@property(nonatomic,strong) NSArray *categories;
@property(nonatomic,strong) NSArray *searchKeys;
@property(nonatomic) NSInteger offset;
@property(nonatomic) NSInteger limits;

-(NSDictionary *)GetQueryString;
//-(NSString *)GetQueryString;

@end
