//
//  LoginViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-1-7.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "LoginViewController.h"
#import "../UserModel.h"
#import "../ErrorModel.h"
#import "../GlobalTokenManager.h"
#import "MBProgressHUD.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginButton;
@synthesize mTextField1;
@synthesize mTextField2;
@synthesize captchaButton;
@synthesize wxButton;
@synthesize qqButton;
@synthesize phoneButton;

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
    UIButton *rememberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rememberButton setFrame:CGRectMake(0, 0, 25, 25)];
    [rememberButton setImage:[UIImage imageNamed:@"lg_rem.png"] forState:UIControlStateNormal];
    [rememberButton setImage:[UIImage imageNamed:@"lg_rem_1.png"] forState:UIControlStateHighlighted];
    [rememberButton setImage:[UIImage imageNamed:@"lg_rem_1.png"] forState:UIControlStateSelected];
    [rememberButton addTarget:self action:@selector(rememberButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    rememberButton.selected = YES;
    [mTextField1 setRightViewMode:UITextFieldViewModeAlways];
    [mTextField1 setRightView:rememberButton];
    
    _permissions = [NSMutableArray arrayWithObjects:
                     kOPEN_PERMISSION_GET_USER_INFO,
                     kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                     kOPEN_PERMISSION_ADD_ALBUM,
                     kOPEN_PERMISSION_ADD_IDOL,
                     kOPEN_PERMISSION_ADD_ONE_BLOG,
                     kOPEN_PERMISSION_ADD_PIC_T,
                     kOPEN_PERMISSION_ADD_SHARE,
                     kOPEN_PERMISSION_ADD_TOPIC,
                     kOPEN_PERMISSION_CHECK_PAGE_FANS,
                     kOPEN_PERMISSION_DEL_IDOL,
                     kOPEN_PERMISSION_DEL_T,
                     kOPEN_PERMISSION_GET_FANSLIST,
                     kOPEN_PERMISSION_GET_IDOLLIST,
                     kOPEN_PERMISSION_GET_INFO,
                     kOPEN_PERMISSION_GET_OTHER_INFO,
                     kOPEN_PERMISSION_GET_REPOST_LIST,
                     kOPEN_PERMISSION_LIST_ALBUM,
                     kOPEN_PERMISSION_UPLOAD_PIC,
                     kOPEN_PERMISSION_GET_VIP_INFO,
                     kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                     kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                     kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO,
                     nil];
    
    //_tencentOauth = [[TencentOAuth alloc] initWithAppId:@"222222" andDelegate:self];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)captchaButtonClicked:(id)sender
{
    [mTextField2 setHidden:NO];
    [captchaButton setHidden:YES];
    [loginButton setHidden:NO];
}

- (IBAction)loginButtonClicked:(id)sender
{
    if (phoneButton.selected) {
        NSString *phone = mTextField1.text;
        MBProgressHUD *progressBar = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:progressBar];
        progressBar.labelText = @"登陆中...";
        progressBar.dimBackground = YES;
        progressBar.square = YES;
        [progressBar show:true];
        
        [UserModel Login:@"" usertoken:@"" usersession:@"" usermobile:phone callbackblock:^(UserModel *user, ErrorModel *error) {
            [progressBar hide:true];
            
            if (error) {
                
                [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:error.data delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
            }
            else{
                [GlobalTokenManager sharedInstance].currentUser = user;
                UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                self.view.window.rootViewController=[secondStoryboard instantiateInitialViewController];
            }
        }];
    }else
    {
        UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.view.window.rootViewController=[secondStoryboard instantiateInitialViewController];
    }
    
    //[self presentViewController:[secondStoryboard instantiateInitialViewController] animated:YES completion:nil];
}
- (IBAction)loginTypeButtonClicked:(id)sender
{
    UIButton *button = (UIButton *)sender;
    wxButton.selected = NO;
    qqButton.selected = NO;
    phoneButton.selected = NO;
    button.selected = YES;
    
    if (button.tag == 2) {
        [_tencentOauth authorize:_permissions inSafari:NO];
    }
}

- (IBAction)numberEntered:(id)sender
{
    
}

- (IBAction)rememberButtonClicked:(id)sender
{
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
}

#pragma mark --
#pragma tencent login degelate
- (void)tencentDidLogin
{
    [_tencentOauth accessToken] ;
    [_tencentOauth openId] ;
    [_tencentOauth expirationDate] ;
    NSLog(@"qq login success");
}

- (void)tencentDidNotLogin:(BOOL)cancelled
{
    NSLog(@"qq login unsuccess");
}

- (void)tencentDidNotNetWork
{
    NSLog(@"no network");
}

@end
