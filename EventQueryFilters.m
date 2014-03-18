//
//  EventQueryFilters.m
//  GoParty
//
//  Created by JoeTang on 14-3-17.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "EventQueryFilters.h"

@interface EventQueryFilters()
-(NSString *)GetQueryStringFromArray:(NSArray *)arr;
@end

static NSString *parameterSeperator = @"|";

@implementation EventQueryFilters

@synthesize offset,searchKeys,sponsors,after,before,categories,limits;

-(NSDictionary *)GetQueryString{
    NSDictionary *queryStrs = [NSDictionary dictionaryWithObjectsAndKeys:@"offset",offset,@"limits",limits,@"before",before,@"after",after, nil];
    NSString *searchKeyStrs = [self GetQueryStringFromArray:searchKeys];
    NSString *sponsorsStrs = [self GetQueryStringFromArray:sponsors];
    NSString *categoriesStrs = [self GetQueryStringFromArray:categories];
    [queryStrs setValue:searchKeyStrs forKey:@"search"];
    [queryStrs setValue:sponsorsStrs forKey:@"sponsors"];
    [queryStrs setValue:categoriesStrs forKey:@"categories"];
    return queryStrs;
}

-(NSString *)GetQueryStringFromArray:(NSArray *)arr{
    NSMutableString *MutStr = nil;
    for (NSString *str in arr) {
        if (!MutStr)
        {
            MutStr = [[NSMutableString alloc] initWithString:str];
        }
        else
        {
            [MutStr appendString:parameterSeperator];
            [MutStr appendString:str];
        }
    }
    
    return MutStr;
}

@end
