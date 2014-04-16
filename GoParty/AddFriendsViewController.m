//
//  AddFriendsViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "AddFriendsViewController.h"

@interface AddFriendsViewController ()

@end

@implementation AddFriendsViewController

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
    //self.title = @"加朋友";
    [self.navigationController setTitle:@"加朋友"];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        return 2;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"搜索号码添加朋友";
    }else{
        return @"";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 40.0f;
    }else{
        return 10.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0) {
        static NSString *CellIdentifier1 = @"AddFriendsSearchCell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1 forIndexPath:indexPath];
        for (UIView *pView in [cell.contentView subviews])
        {
            if (pView.tag == 1) {
                UITextField *textField = (UITextField *)pView;
                UIImageView *searchImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
                [searchImg setImage:[UIImage imageNamed:@"a_search.png"]];
                [textField setRightViewMode:UITextFieldViewModeAlways];
                [textField setRightView:searchImg];
            }
        }
        return cell;
    }
    else{
        static NSString *CellIdentifier2 = @"AddFriendsSearchCell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2 forIndexPath:indexPath];
        NSString *imageName = @"a_qq.png";
        NSString *cellText = @"添加QQ好友";
        if ([indexPath row] == 1)
        {
            imageName = @"a_phone.png";
            cellText = @"添加手机联系人";
        }
        
        for (UIView *pView in [cell.contentView subviews])
        {
            if (pView.tag == 1) {
                UIImageView *imageView = (UIImageView *)pView;
                [imageView setImage:[UIImage imageNamed:imageName]];
            }
            else if (pView.tag == 2){
                UILabel *label = (UILabel *)pView;
                [label setText:cellText];
            }
        }
        
        return cell;
    }
    
    return nil;
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
