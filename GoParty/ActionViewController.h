//
//  ActionViewController.h
//  GoParty
//
//  Created by maszmacadmin on 14-1-9.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    NSInteger _detailRow;
}

@property (nonatomic, retain)IBOutlet UISegmentedControl *SegControl;

@end
