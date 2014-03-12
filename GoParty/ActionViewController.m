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
    self.title = @"活动";
    [self.navigationController setTitle:self.title];
    
    CGRect frme = SegControl.frame;
    [SegControl removeFromSuperview];
    SegControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"时间", @"发起人", @"类型", nil]];
    [SegControl setFrame:frme];
    [SegControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [SegControl setSelectedSegmentIndex:0];
    [SegControl setTintColor:[UIColor darkGrayColor]];
    [self.view addSubview:SegControl];
    
    _detailRow = -1;
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (UIView *)GetActionDetailsView
{
    UIView *pView = [[UIView alloc] initWithFrame:CGRectMake(10, 55, 300, 167)];
    pView.tag = 99;
    [pView setBackgroundColor:[UIColor clearColor]];
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 7, pView.frame.size.width, pView.frame.size.height-7)];
    [subView setBackgroundColor:[UIColor whiteColor]];
    subView.layer.masksToBounds = YES;
    subView.layer.cornerRadius = 6.0;
    subView.layer.borderWidth = 0.5f;
    subView.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    [pView addSubview:subView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 60)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:@"这种实现看起来不咋样，还是自己画框，或者让UX阿姨把图片重新做下，然后给出线框和背景的RGB值！目前就这样，里面的先不做了。"];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setNumberOfLines:3];
    [label setTextColor:[UIColor blackColor]];
    [pView addSubview:label];
    UIImageView *pointView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 10, 8)];
    [pointView setImage:[UIImage imageNamed:@"a_point.png"]];
    [pView addSubview:pointView];
    return pView;
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
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        [cell setBackgroundColor:[UIColor clearColor]];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
//        [imageView setImage:[UIImage imageNamed:@"wechat_logo.png"]];
//        imageView.tag = 1;
//        [cell.contentView addSubview:imageView];
//        
//        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(68, 10, 80, 20)];
//        [nameLabel setBackgroundColor:[UIColor clearColor]];
//        [nameLabel setText:@"瑞贝卡"];
//        [nameLabel setFont:[UIFont systemFontOfSize:14]];
//        nameLabel.tag = 2;
//        [cell.contentView addSubview:nameLabel];
//        
//        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(68, 33, 80, 20)];
//        [numLabel setBackgroundColor:[UIColor clearColor]];
//        [numLabel setTextColor:[UIColor lightGrayColor]];
//        [numLabel setText:@"活动数: 4"];
//        [numLabel setFont:[UIFont systemFontOfSize:14]];
//        numLabel.tag = 3;
//        [cell.contentView addSubview:numLabel];
//        
//        UILabel *starLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 33, 35, 20)];
//        [starLabel setBackgroundColor:[UIColor clearColor]];
//        [starLabel setTextColor:[UIColor lightGrayColor]];
//        [starLabel setText:@"好评:"];
//        [starLabel setFont:[UIFont systemFontOfSize:14]];
//        [cell.contentView addSubview:nameLabel];
//        
//        for (int i=0; i<5; i++) {
//            UIImageView *star = [[UIImageView alloc] initWithFrame:CGRectMake(205+i*20, 33, 20, 20)];
//            [star setImage:[UIImage imageNamed:@"a_star.png"]];
//            [star setHighlightedImage:[UIImage imageNamed:@"a_star_1.png"]];
//            star.tag = 10 + i + 1;
//            [cell.contentView addSubview:star];
//        }
//    }
    
    // Configure the cell...
    for (UIImageView *pView in [cell.contentView subviews]) {
        if (pView.tag > 10 && pView.tag < 15) {
            pView.highlighted = YES;
        }
    }
    
    if (_detailRow == [indexPath row]) {
        [cell.contentView addSubview:[self GetActionDetailsView]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_detailRow == [indexPath row]) {
        return 230.0f;
    }
    
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_detailRow != -1)
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_detailRow inSection:0]];
        for (UIView *pView in [cell.contentView subviews]) {
            if (pView.tag == 99) {
                [pView removeFromSuperview];
            }
        }
    }
    
    if (_detailRow == [indexPath row]) {
        _detailRow = -1;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else{
        _detailRow = [indexPath row];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
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

@end
