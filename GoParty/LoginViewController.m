//
//  LoginViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-1-7.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginButton;
@synthesize mTextField1;
@synthesize mTextField2;
@synthesize captchaButton;

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

- (IBAction)captchaButtonClicked:(id)sender
{
    [mTextField2 setHidden:NO];
    [captchaButton setHidden:YES];
    [loginButton setHidden:NO];
}

- (IBAction)loginButtonClicked:(id)sender
{
    UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.view.window.rootViewController=[secondStoryboard instantiateInitialViewController];
    //[self presentViewController:[secondStoryboard instantiateInitialViewController] animated:YES completion:nil];
}

@end
