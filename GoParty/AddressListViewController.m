//
//  AddressListViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-1-9.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "AddressListViewController.h"

@interface AddressListViewController ()

@end

@implementation AddressListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //self.title = @"联系人";
    [self.navigationController setTitle:@"联系人"];
    [super viewDidLoad];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setFrame:CGRectMake(20, (44-70/2)/2, 70/2, 70/2)];
    [_addButton setImage:[UIImage imageNamed:@"l_add.png"] forState:UIControlStateNormal];
    [_addButton setImage:[UIImage imageNamed:@"l_add_1.png"] forState:UIControlStateHighlighted];
    [_addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_addButton];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [UIView beginAnimations:Nil context:nil];
//    [self.navigationController.navigationBar addSubview:_addButton];
//    [UIView commitAnimations];
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [_addButton removeFromSuperview];
//}

- (IBAction)addButtonClicked:(id)sender
{
    //[self performSegueWithIdentifier:@"AddFriendsIdentifier" sender:self];
    NSNotification *noti = [NSNotification notificationWithName:Main_Notification_AddFriends object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @" ";
    }else{
        return @"好友";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 20.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0) {
        static NSString *CellIdentifier1 = @"AddressListCell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1 forIndexPath:indexPath];
        return cell;
    }
    else{
        static NSString *CellIdentifier2 = @"AddressListCell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2 forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
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
    if ([indexPath section] == 1) {
        NSNotification *noti = [NSNotification notificationWithName:Main_Notification_UserInfo object:indexPath];
        [[NSNotificationCenter defaultCenter] postNotification:noti];
    }
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
