//
//  MainTabBarViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-1-9.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainTabBarController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UserCellClicked:) name:@"UserInfoCellClickedNotification" object:nil];
//    [self.tabBar setBarTintColor:[UIColor blackColor]];
//    UITabBarItem *item0 = [[self.tabBar items] objectAtIndex:0];
//    [item0 setSelectedImage:[[UIImage imageNamed:@"f_01.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    UITabBarItem *item1 = [[self.tabBar items] objectAtIndex:1];
//    [item1 setSelectedImage:[[UIImage imageNamed:@"f_02.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    UITabBarItem *item2 = [[self.tabBar items] objectAtIndex:2];
//    [item2 setSelectedImage:[[UIImage imageNamed:@"f_03.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    UITabBarItem *item3 = [[self.tabBar items] objectAtIndex:3];
//    [item3 setSelectedImage:[[UIImage imageNamed:@"f_04.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    _mainTabBarController = [[MainTabBarController alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49)];
    [_mainTabBarController.view setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [self.view addSubview:_mainTabBarController.view];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UserCellClicked:(NSNotification *)notification
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self performSegueWithIdentifier:@"UserInfoIdentifier" sender:self];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [_mainTabBarController didSelectItemWithTag:item.tag];
}

@end
