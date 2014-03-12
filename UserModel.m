//
//  UserModel.m
//  GoParty
//
//  Created by JoeTang on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

@synthesize _id = _userId;
@synthesize _name = _userName;

- (id)initWithAttributes:(NSDictionary *)attributes{

    self = [super init];
    if (!self) {
        return nil;
    }
    
    _userId = [[attributes valueForKeyPath:@"id"] integerValue];
    _userName = [attributes valueForKeyPath:@"screen_name"];
    
    return self;
}

@end
