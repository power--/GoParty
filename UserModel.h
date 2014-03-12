//
//  UserModel.h
//  GoParty
//
//  Created by JoeTang on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(readonly) NSInteger _id;
@property(readonly) NSString *_name;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
