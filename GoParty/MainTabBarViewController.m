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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UserCellClicked:) name:Main_Notification_UserInfo object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AddFriendsClicked:) name:Main_Notification_AddFriends object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ActionCellClicked:) name:Main_Notification_ActionCell object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AddActionClicked:) name:Main_Notification_AddAction object:nil];
    
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

- (void)AddFriendsClicked:(NSNotification *)notification
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self performSegueWithIdentifier:@"AddFriendsIdentifier" sender:self];
}

- (void)ActionCellClicked:(NSNotification *)notification
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self performSegueWithIdentifier:@"ActionMainIndentifier" sender:self];
}

- (void)AddActionClicked:(NSNotification *)notification
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self performSegueWithIdentifier:@"AddActionIndentifier" sender:self];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [_mainTabBarController didSelectItemWithTag:item.tag];
}

@end
