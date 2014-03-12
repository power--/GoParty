//
//  goPartyAppDelegate.h
//  GoParty
//
//  Created by maszmacadmin on 14-1-7.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@interface goPartyAppDelegate : UIResponder <UIApplicationDelegate, WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
