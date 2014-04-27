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
@property(nonatomic,strong) NSMutableArray *categories;
@property(nonatomic,strong) NSMutableArray *search;
@property(nonatomic) NSInteger offset;
@property(nonatomic) NSInteger limit;

-(NSDictionary *)GetQueryString;
//-(NSString *)GetQueryString;

@end
