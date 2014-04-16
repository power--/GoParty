//
//  ActionFriendsViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-4-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "ActionFriendsViewController.h"

@interface ActionFriendsViewController ()

@end

@implementation ActionFriendsViewController
@synthesize ScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    _selectFriends = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ChooseButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)resetScrollViewWithFriend:(NSIndexPath *)indexPath
{
    [UIView beginAnimations:nil context:nil];
    if ([_selectFriends containsObject:indexPath]) {
        int tag = [_selectFriends indexOfObject:indexPath] + 1;
        [_selectFriends removeObject:indexPath];
        for (UIImageView *pView in [ScrollView subviews]) {
            if (pView.tag == tag) {
                [pView removeFromSuperview];
            }
        }
        
        for (UIImageView *pView in [ScrollView subviews]) {
            if (pView.tag > tag) {
                [pView setFrame:CGRectMake(pView.frame.origin.x-pView.frame.size.width-10, pView.frame.origin.y, pView.frame.size.width, pView.frame.size.height)];
                pView.tag--;
            }
        }
        [ScrollView setContentSize:CGSizeMake(10+_selectFriends.count*(10+40), 44)];
    }else{
        [_selectFriends addObject:indexPath];
        int tag = [_selectFriends count];
        UIImageView *pView = [[UIImageView alloc] initWithFrame:CGRectMake(10+(tag-1)*(10+40), 2, 40, 40)];
        pView.tag = tag;
        [pView setImage:[UIImage imageNamed:@"icon.png"]];
        [ScrollView addSubview:pView];
        [ScrollView setContentSize:CGSizeMake(10+tag*(10+40), 44)];
        [ScrollView scrollRectToVisible:pView.frame animated:YES];
    }
    
    [UIView commitAnimations];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"好友";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AddFriendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    [self resetScrollViewWithFriend:indexPath];
}

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
