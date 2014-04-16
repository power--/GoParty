//
//  ActionMainViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-3-26.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "ActionMainViewController.h"

@interface ActionMainViewController ()

@end

@implementation ActionMainViewController
@synthesize SegControl;
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
    [self.navigationController setTitle:@"活动"];
    
    CGRect frme = SegControl.frame;
    [SegControl removeFromSuperview];
    SegControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"详情", @"聊天", @"分享", nil]];
    [SegControl setFrame:frme];
    [SegControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [SegControl setSelectedSegmentIndex:0];
    [SegControl setTintColor:[UIColor darkGrayColor]];
    [SegControl addTarget:self action:@selector(segControllerSelected:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:SegControl];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segControllerSelected:(id)sender
{
    
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

@end
