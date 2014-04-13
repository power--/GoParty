//
//  ActionMainChatViewController.h
//  GoParty
//
//  Created by maszmacadmin on 14-4-10.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCChatSelectionView.h"

@interface ActionMainChatViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, WCShareMoreDelegate>
{
    IBOutlet UITableView *msgRecordTable;
    IBOutlet UITextField *messageText;
    IBOutlet UIView *inputBar;
    WCChatSelectionView *_shareMoreView;
}

@property (nonatomic, strong) NSMutableArray *resultArray;

- (IBAction)sendIt:(id)sender;
- (IBAction)shareMore:(id)sender;

@end
