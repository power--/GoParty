//
//  LoginViewController.h
//  GoParty
//
//  Created by maszmacadmin on 14-1-7.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic, readonly)IBOutlet UIButton *captchaButton;
@property (nonatomic, readonly)IBOutlet UIButton *loginButton;
@property (nonatomic, readonly)IBOutlet UITextField *mTextField1;
@property (nonatomic, readonly)IBOutlet UITextField *mTextField2;

- (IBAction)captchaButtonClicked:(id)sender;
- (IBAction)loginButtonClicked:(id)sender;

@end
