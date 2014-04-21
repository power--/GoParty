//
//  ActionMainViewController.h
//  GoParty
//
//  Created by maszmacadmin on 14-3-26.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ActionMainDetailViewController;
@class ActionMainShareViewController;
@class ActionMainChatViewController;

@interface ActionMainViewController : UIViewController
{
    ActionMainDetailViewController *_detailController;
    ActionMainShareViewController *_shareController;
    ActionMainChatViewController *_chatController;
}

@property (nonatomic, retain)IBOutlet UISegmentedControl *SegControl;
@property (nonatomic, retain)IBOutlet UIScrollView *ScrollView;


@end
