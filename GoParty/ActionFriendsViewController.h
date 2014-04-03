//
//  ActionFriendsViewController.h
//  GoParty
//
//  Created by maszmacadmin on 14-4-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionFriendsViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_selectFriends;
}

@property(nonatomic)IBOutlet UIScrollView *ScrollView;

- (IBAction)ChooseButtonClicked:(id)sender;

@end
