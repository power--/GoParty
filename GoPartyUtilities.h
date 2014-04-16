//
//  GoPartyUtilities.h
//  GoParty
//
//  Created by JoeTang on 14-3-16.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GoParty/MBProgressHUD.h"

@interface GoPartyUtilities : NSObject

+(NSDictionary *)GetDicFromNormalClass:(id) classInstance;
+(MBProgressHUD *)GenerateProgressHud:(NSString *)title subtitle:(NSString *)hudSubtitle view:(UIView *)parentView;


@end
