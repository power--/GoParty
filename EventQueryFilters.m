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

//@synthesize offset,searchKeys,sponsors,after,before,categories,limit;

-(NSDictionary *)GetQueryString{
    NSMutableDictionary *queryStrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:self.offset],@"offset",[NSNumber numberWithInteger:self.limit],@"limit", nil];
    if (self.before) {
        [queryStrs setValue:self.before forKey:@"before"];
    }
    if (self.after) {
        [queryStrs setValue:self.after forKey:@"after"];
    }
    if (self.scope) {
        [queryStrs setValue:self.scope forKey:@"scope"];
    }
    
    NSString *searchKeyStrs = [self GetQueryStringFromArray:self.search];
    //NSString *sponsorsStrs = [self GetQueryStringFromArray:self.sponsors];
    NSString *categoriesStrs = [self GetQueryStringFromArray:self.categories];
    if (searchKeyStrs) {
        [queryStrs setValue:searchKeyStrs forKey:@"search"];
    }
    
//    if (sponsorsStrs) {
//        [queryStrs setValue:sponsorsStrs forKey:@"sponsors"];
//    }
    
    if (categoriesStrs) {
        [queryStrs setValue:categoriesStrs forKey:@"categories"];
    }
    
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
