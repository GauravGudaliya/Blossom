//
//  EditProfileViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/28/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "EditProfileViewController.h"
#import "Header.h"
@interface EditProfileViewController ()
{
    UIBarButtonItem *btnBackBar;
    UIBarButtonItem *btnCancleBar;
}
@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
    // Do any additional setup after loading the view.
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
    
    
    UIButton *btnCancle=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancle setTitle:
     BTNCANCLE forState:UIControlStateNormal];
    [btnCancle setTitleColor:[UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnCancle setFont:[UIFont fontWithName:FONT_REGULAR size:17]];
    [btnCancle addTarget:self action:@selector(btnCancleTap) forControlEvents:UIControlEventTouchUpInside];
    
    btnCancleBar=[[UIBarButtonItem alloc]initWithCustomView:btnCancle];
    btnCancle.frame=CGRectMake(0, 0, 95, 35);
    self.navigationItem.rightBarButtonItem=btnCancleBar;
    UIImageView *ivBarLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_logo"]];
    
    ivBarLogo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=ivBarLogo;
}
-(void)btnBackTap
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnCancleTap
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
