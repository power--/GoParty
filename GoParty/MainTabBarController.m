//
//  MainTabBarController.m
//  GoParty
//
//  Created by maszmacadmin on 14-2-26.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithNibName:Nil bundle:Nil]) {
        [self.view setFrame:frame];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [self.view setUserInteractionEnabled:NO];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    _subBackImg = [[UIImageView alloc] initWithFrame:CGRectMake(25/2, 0.75, 110/2, 95/2)];
    [_subBackImg setImage:[UIImage imageNamed:@"f_subBg.png"]];
    [self.view addSubview:_subBackImg];
    
    _subMain = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"f_01.png"] highlightedImage:[UIImage imageNamed:@"f_01_1.png"]];
    [_subMain setFrame:CGRectMake(25/2, 0.75, 110/2, 95/2)];
    _subMain.tag = 1;
    [_subMain setHighlighted:YES];
    [self.view addSubview:_subMain];
    
    _selectedTag = 1;
    
    _subContact = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"f_02.png"] highlightedImage:[UIImage imageNamed:@"f_02_1.png"]];
    [_subContact setFrame:CGRectMake(25/2*3+110/2, 0.75, 110/2, 95/2)];
    _subContact.tag = 2;
    [self.view addSubview:_subContact];
    
    _subEvent = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"f_03.png"] highlightedImage:[UIImage imageNamed:@"f_03_1.png"]];
    [_subEvent setFrame:CGRectMake(25/2*5+110, 0.75, 110/2, 95/2)];
    _subEvent.tag = 3;
    [self.view addSubview:_subEvent];
    
    _subSetting = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"f_04.png"] highlightedImage:[UIImage imageNamed:@"f_04_1.png"]];
    [_subSetting setFrame:CGRectMake(25/2*7+110/2*3, 0.75, 110/2, 95/2)];
    _subSetting.tag = 4;
    [self.view addSubview:_subSetting];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)getSubItemWithTag:(int)tag
{
    switch (tag) {
        case 1:
            return _subMain;
            break;
        case 2:
            return _subContact;
            break;
        case 3:
            return _subEvent;
            break;
        case 4:
            return _subSetting;
            break;
        default:
            return _subBackImg;
            break;
    }
}

- (void)didSelectItemWithTag:(int)tag
{
    [UIView beginAnimations:@"mainTabBarSelectChanged" context:nil];
    [_subBackImg setFrame:CGRectMake(25/2*(2*tag-1)+110/2*(tag-1), 0.75, 110/2, 95/2)];
    [[self getSubItemWithTag:_selectedTag] setHighlighted:NO];
    [[self getSubItemWithTag:tag] setHighlighted:YES];
    _selectedTag = tag;
    [UIView commitAnimations];
}

@end
