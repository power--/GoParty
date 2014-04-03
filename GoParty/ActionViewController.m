//
//  ActionViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-1-9.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "ActionViewController.h"
#import "MapTipView.h"
#import <QuartzCore/QuartzCore.h>

@interface ActionViewController ()

@end

@implementation ActionViewController
@synthesize SegControl;

- (void)viewDidLoad
{
    //self.title = @"活动";
    [self.navigationController setTitle:@"活动"];
    
    CGRect frme = SegControl.frame;
    [SegControl removeFromSuperview];
    SegControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"时间", @"发起人", @"类型", nil]];
    [SegControl setFrame:frme];
    [SegControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [SegControl setSelectedSegmentIndex:0];
    [SegControl setTintColor:[UIColor darkGrayColor]];
    [SegControl addTarget:self action:@selector(segControllerSelected:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:SegControl];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setFrame:CGRectMake(20, (44-70/2)/2, 70/2, 70/2)];
    [_addButton setImage:[UIImage imageNamed:@"l_add.png"] forState:UIControlStateNormal];
    [_addButton setImage:[UIImage imageNamed:@"l_add_1.png"] forState:UIControlStateHighlighted];
    [_addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_addButton];
    
    [super viewDidLoad];
}

- (IBAction)segControllerSelected:(id)sender
{
    
}

- (IBAction)addButtonClicked:(id)sender
{
    //[self performSegueWithIdentifier:@"AddFriendsIdentifier" sender:self];
    NSNotification *noti = [NSNotification notificationWithName:Main_Notification_AddAction object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PartyActionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    for (UIImageView *pView in [cell.contentView subviews]) {
        if (pView.tag > 10 && pView.tag < 15) {
            pView.highlighted = YES;
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNotification *noti = [NSNotification notificationWithName:Main_Notification_ActionCell object:indexPath];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
