//
//  AddActionViewController.h
//  GoParty
//
//  Created by maszmacadmin on 14-3-31.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddActionViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>

@property (nonatomic)IBOutlet UIScrollView *ChooseScrollView;
@property (nonatomic)IBOutlet UITableView *TableView;

- (IBAction)ChooseButtonClicked:(id)sender;
- (IBAction)textFieldEndEdite:(id)sender;

@end
