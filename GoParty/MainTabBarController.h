//
//  MainTabBarController.h
//  GoParty
//
//  Created by maszmacadmin on 14-2-26.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarController : UIViewController
{
    UIImageView *_subBackImg;
    UIImageView *_subMain;
    UIImageView *_subContact;
    UIImageView *_subEvent;
    UIImageView *_subSetting;
    int _selectedTag;
}

- (id)initWithFrame:(CGRect)frame;

- (void)didSelectItemWithTag:(int)tag;

@end
