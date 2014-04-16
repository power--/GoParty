//
//  LoginViewController.h
//  GoParty
//
//  Created by maszmacadmin on 14-1-7.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>

@interface LoginViewController : UIViewController
<TencentSessionDelegate>
{
    TencentOAuth *_tencentOauth;
    NSMutableArray* _permissions;;
}

@property (nonatomic, readonly)IBOutlet UIButton *captchaButton;
@property (nonatomic, readonly)IBOutlet UIButton *loginButton;
@property (nonatomic, readonly)IBOutlet UITextField *mTextField1;
@property (nonatomic, readonly)IBOutlet UITextField *mTextField2;
@property (nonatomic, readonly)IBOutlet UIButton *wxButton;
@property (nonatomic, readonly)IBOutlet UIButton *qqButton;
@property (nonatomic, readonly)IBOutlet UIButton *phoneButton;

- (IBAction)captchaButtonClicked:(id)sender;
- (IBAction)loginButtonClicked:(id)sender;
- (IBAction)loginTypeButtonClicked:(id)sender;
- (IBAction)numberEntered:(id)sender;

@end
