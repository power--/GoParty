//
//  MyNaviViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-2-26.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "MyNaviViewController.h"

@interface MyNaviViewController ()

@end

@implementation MyNaviViewController

- (void)viewDidLoad
{
    self.navigationBar.translucent = NO;
    self.navigationBar.tintColor = [UIColor clearColor];
    //[self.navigationBar.backItem setHidesBackButton:YES];
    
    _backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    _backgroundView.image = [UIImage imageNamed:@"naviBarBg"];
    [_backgroundView setUserInteractionEnabled:YES];
    [_backgroundView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [self.navigationBar addSubview:_backgroundView];
    
    _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat y = (_backgroundView.frame.size.height-70/2)/2;
    [_returnButton setFrame:CGRectMake(20, y, 70/2, 70/2)];
    [_returnButton setImage:[UIImage imageNamed:@"naviReturn.png"] forState:UIControlStateNormal];
    [_returnButton setImage:[UIImage imageNamed:@"naviReturn_1.png"] forState:UIControlStateHighlighted];
    [_returnButton addTarget:self action:@selector(returnButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    _returnButton.hidden = YES;
    [_backgroundView addSubview:_returnButton];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_returnButton.frame.origin.x+_returnButton.frame.size.width, 0, _backgroundView.frame.size.width-(_returnButton.frame.origin.x+_returnButton.frame.size.width)-20, _backgroundView.frame.size.height)];
    //[_titleLabel setText:@"主页活动"];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentRight];
    [_backgroundView addSubview:_titleLabel];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTitle:(NSString *)title
{
    [_titleLabel setText:title];
}

- (IBAction)returnButtonClicked:(id)sender
{
    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    //NSLog(@"%@", viewController.title);
    [_titleLabel setText:viewController.title];
    //NSLog(@"%@", viewController.title);
    //[self.navigationBar bringSubviewToFront:backgroundView];
    [self.navigationBar performSelector:@selector(bringSubviewToFront:) withObject:_backgroundView afterDelay:0.2f];
    if (self.viewControllers.count > 1)
    {
        _returnButton.hidden = NO;
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [super popViewControllerAnimated:animated];
    UIViewController *viewController = [self.viewControllers objectAtIndex:self.viewControllers.count-1];
    [_titleLabel setText:viewController.title];
    //[self.navigationBar bringSubviewToFront:backgroundView];
    [self.navigationBar performSelector:@selector(bringSubviewToFront:) withObject:_backgroundView afterDelay:0.2f];
    if (self.viewControllers.count <= 1)
    {
        _returnButton.hidden = YES;
    }
    
    return viewController;
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *array = [super popToViewController:viewController animated:animated];
    [_titleLabel setText:viewController.title];
    //[self.navigationBar bringSubviewToFront:backgroundView];
    [self.navigationBar performSelector:@selector(bringSubviewToFront:) withObject:_backgroundView afterDelay:0.2f];
    if (self.viewControllers.count <= 1)
    {
        _returnButton.hidden = YES;
    }
    
    return array;
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    NSArray *array = [super popToRootViewControllerAnimated:animated];
    UIViewController *viewController = [self.viewControllers objectAtIndex:0];
    [_titleLabel setText:viewController.title];
    //[self.navigationBar bringSubviewToFront:backgroundView];
    [self.navigationBar performSelector:@selector(bringSubviewToFront:) withObject:_backgroundView afterDelay:0.2f];
    if (self.viewControllers.count <= 1)
    {
        _returnButton.hidden = YES;
    }
    
    return array;
    
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden
{
    [super setNavigationBarHidden:navigationBarHidden];
}

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated
{
    [super setNavigationBarHidden:hidden animated:animated];
}

@end
