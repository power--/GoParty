//
//  ActionMainShareViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-4-10.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "ActionMainShareViewController.h"

@interface ActionMainShareViewController ()

@end

@implementation ActionMainShareViewController

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

#pragma UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat nameHeight = 20;
    
    NSString *content = @"缺个菜，等兔子装死在树上回来好下锅！";
    UIFont *font = [UIFont systemFontOfSize:14];
	CGSize contentSize = [content sizeWithFont:font constrainedToSize:CGSizeMake(250.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    int imgCount = 3;
    int imgRow = imgCount/3 + imgCount%4 > 0 ? 1 : 0;
    CGFloat imgHeight = imgRow * 80.0f + (imgRow - 1) * 5;
    
    CGFloat toolHeight = 20;
    
    int reviewCount = 2;
    CGFloat reviewHeight = reviewCount * 20 + 10*2;
    
    return 5 + nameHeight + contentSize.height+10 + 5 + imgHeight + 5 + toolHeight + 5 + reviewHeight + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"ShareCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else{
        for (UIView *cellView in cell.contentView.subviews){
            [cellView removeFromSuperview];
        }
    }
    
    UIImageView *photo = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
    photo.image = [UIImage imageNamed:@"wechat_logo.jpg"];
    [cell.contentView addSubview:photo];
    
    UIFont *font = [UIFont systemFontOfSize:14];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 320-60-5, 20)];
    [nameLabel setBackgroundColor:[UIColor clearColor]];
    [nameLabel setTextColor:[UIColor blueColor]];
    [nameLabel setFont:font];
    [nameLabel setText:@"秀秀"];
    [cell.contentView addSubview:nameLabel];
    
    NSString *content = @"缺个菜，等兔子撞死在树上捡回来好下锅！我有一头小毛驴我从来也不骑，啦啦啦啦 啦啦啦啦 啦啦啦啦啦！";
	CGSize contentSize = [content sizeWithFont:font constrainedToSize:CGSizeMake(250.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 25, 320-60-5, contentSize.height + 10)];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [contentLabel setTextColor:[UIColor blackColor]];
    [contentLabel setFont:font];
    [contentLabel setText:content];
    [cell.contentView addSubview:contentLabel];
    
    for (int i = 0; i<3; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60+i*(80+5), 25+contentLabel.frame.size.height+5, 80, 80)];
        [imgView setImage:[UIImage imageNamed:@"mobile_logo.jpg"]];
        [cell.contentView addSubview:imgView];
    }
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 25+contentLabel.frame.size.height+5+80+5, 320-60-5, 20)];
    [timeLabel setBackgroundColor:[UIColor clearColor]];
    [timeLabel setTextColor:[UIColor darkGrayColor]];
    [timeLabel setFont:font];
    [timeLabel setText:@"今天 20:15"];
    [cell.contentView addSubview:timeLabel];
    
    UIView *review = [[UIView alloc] initWithFrame:CGRectMake(60, timeLabel.frame.origin.y+20+5, 320-60-5, 20*2+10)];
    [review setBackgroundColor:[UIColor lightGrayColor]];
    
    
    NSString *reviewContent = @"Roy:今天这兔子够肥，管饱！\r\n\基哥:只求兔鞭一条!";
    contentSize = [reviewContent sizeWithFont:font constrainedToSize:CGSizeMake(250.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 250, 60)];
    [textView setText:reviewContent];
    [textView setFont:font];
    [textView setEditable:NO];
    [textView setBackgroundColor:[UIColor clearColor]];
    [textView setTextColor:[UIColor darkGrayColor]];
    [textView setText:reviewContent];
    [review addSubview:textView];
    [cell.contentView addSubview:review];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
