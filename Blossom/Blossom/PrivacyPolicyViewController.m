//
//  PrivacyPolicyViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/30/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "PrivacyPolicyViewController.h"
#import "Header.h"
@interface PrivacyPolicyViewController ()
{
    UIBarButtonItem *btnBackBar;
}
@end

@implementation PrivacyPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpNavigationBar
{
    UIButton *btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnBack setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [btnBack setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btnBack.frame=CGRectMake(0, 0, 40, 40);
    [btnBack addTarget:self action:@selector(btnBackTap) forControlEvents:UIControlEventTouchUpInside];
    btnBackBar=[[UIBarButtonItem alloc]initWithCustomView:btnBack];
    self.navigationItem.leftBarButtonItem=btnBackBar;
    
    UIImageView *ivBarLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_logo"]];
    
    ivBarLogo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=ivBarLogo;
}
-(void)btnBackTap
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
