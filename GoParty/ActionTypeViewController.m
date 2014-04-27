//
//  ActionTypeViewController.m
//  GoParty
//
//  Created by maszmacadmin on 14-3-31.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "ActionTypeViewController.h"
#import "../EventCategory.h"
#import "MBProgressHUD.h"
#import "../ErrorModel.h"

@interface ActionTypeViewController ()
@property(nonatomic,strong) NSArray *caregoriesList;
@end

@implementation ActionTypeViewController

-(NSArray *)caregoriesList{
    if(!_caregoriesList)_caregoriesList = [[NSArray alloc] init];
    return _caregoriesList;
}

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
    [self.navigationController setTitle:@"类型"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MBProgressHUD *progressBar = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:progressBar];
    progressBar.labelText = @"加载中...";
    progressBar.dimBackground = YES;
    progressBar.square = YES;
    [progressBar show:true];
    [EventCategory QueryAllEventCategories:^(NSArray *categories, ErrorModel *error) {
        [progressBar hide:true];
        if (error) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:error.data delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
        }else{
            self.caregoriesList = categories;
            UICollectionView *collectionView = (UICollectionView*)[self.view viewWithTag:1];
            [collectionView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ChooseButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma mark --
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.caregoriesList count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indetifier = @"ActionTypeCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indetifier forIndexPath:indexPath];
    EventCategory *category = (EventCategory *)[self.caregoriesList objectAtIndex:indexPath.section *1 + indexPath.row];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    //imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:category.logo]]];
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cdn.sstatic.net/stackoverflow/img/apple-touch-icon.png"]]];
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.text = category.name;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
