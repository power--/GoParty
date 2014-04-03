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

//@synthesize offset,searchKeys,sponsors,after,before,categories,limits;

-(NSDictionary *)GetQueryString{
    NSDictionary *queryStrs = [NSDictionary dictionaryWithObjectsAndKeys:@"offset",self.offset,@"limits",self.limits,@"before",self.before,@"after",self.after, nil];
    NSString *searchKeyStrs = [self GetQueryStringFromArray:self.searchKeys];
    NSString *sponsorsStrs = [self GetQueryStringFromArray:self.sponsors];
    NSString *categoriesStrs = [self GetQueryStringFromArray:self.categories];
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
