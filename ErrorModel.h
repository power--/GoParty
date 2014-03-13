//
//  ErrorModel.h
//  GoParty
//
//  Created by JoeTang on 14-3-13.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@interface ErrorModel : Jastor

@property(nonatomic,strong) NSString *code;
@property(nonatomic,strong) NSString *data;
@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) NSString *status;


@end
