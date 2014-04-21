//
//  ActionMainDetailViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-4-10.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "ActionMainDetailViewController.h"


@interface ActionMainDetailViewController ()

@end

@implementation ActionMainDetailViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    NSString *CellIdentifier = [NSString stringWithFormat:@"DetailActionCell%d", row + 1];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (row == 2 || row == 5) {
        NSString *str = @"东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！";
        UIFont *font = [UIFont systemFontOfSize:12];
        CGSize contentSize = [str sizeWithFont:font constrainedToSize:CGSizeMake(270.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
        CGRect frame = CGRectMake(20, 5, 280, row == 2 ? 60 : contentSize.height + 10 + 30);
        UITextField *textField = [[UITextField alloc] initWithFrame:frame];
        [textField setBorderStyle:UITextBorderStyleRoundedRect];
        [textField setFont:[UIFont systemFontOfSize:12]];
        [textField setUserInteractionEnabled:NO];
        [textField setBackgroundColor:[UIColor whiteColor]];
        [cell.contentView addSubview:textField];
        [cell.contentView sendSubviewToBack:textField];
    }
    // Configure the cell...
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    if (row == 2) {
        return 70;
    }
    else if (row == 5){
        NSString *str = @"东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！东西冲！！！";
        UIFont *font = [UIFont systemFontOfSize:12];
        CGSize contentSize = [str sizeWithFont:font constrainedToSize:CGSizeMake(270.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
        return contentSize.height + 10 + 30 + 10;
    }
    
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSNotification *noti = [NSNotification notificationWithName:Main_Notification_ActionCell object:indexPath];
    //    [[NSNotificationCenter defaultCenter] postNotification:noti];
    int row = [indexPath row];
    switch (row) {
        case 1:
            //
            break;
        case 2:
            //
            break;
        case 3:
            //[self performSegueWithIdentifier:@"ActionTypeIdentifier" sender:self];
            break;
        case 4:
            //
            break;
        default:
            break;
    }
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

#pragma mark --
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [UIView beginAnimations:nil context:nil];
    [textView setFrame:CGRectMake(textView.frame.origin.x, textView.frame.origin.y-120, textView.frame.size.width, textView.frame.size.height)];
    [UIView commitAnimations];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [UIView beginAnimations:nil context:nil];
    [textView setFrame:CGRectMake(textView.frame.origin.x, textView.frame.origin.y+120, textView.frame.size.width, textView.frame.size.height)];
    [UIView commitAnimations];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (IBAction)textFieldEndEdite:(id)sender
{
    
}

@end
