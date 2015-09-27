//
//  ProfileViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/27/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "ProfileViewController.h"
#import "Header.h"
@interface ProfileViewController ()
{
    UIBarButtonItem *btnProfileBar;
    UIBarButtonItem *btnLogoutBar;

}
@end

@implementation ProfileViewController

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
    UIButton *btnProfile=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnProfile setTitle:BTNPROFILE forState:UIControlStateNormal];
    [btnProfile setImage:[UIImage imageNamed:@"menuIcon"] forState:UIControlStateNormal];
    [btnProfile setTitleColor:[UIColor colorWithRed:255.0/255.0 green:129.0/255.0 blue:97.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnProfile setFont:[UIFont fontWithName:FONT_REGULAR size:17]];
    [btnProfile addTarget:self action:@selector(btnProfileTap:) forControlEvents:UIControlEventTouchUpInside];
    btnProfileBar=[[UIBarButtonItem alloc]initWithCustomView:btnProfile];
    btnProfile.frame=CGRectMake(0, 0, 95, 35);
    self.navigationItem.leftBarButtonItem=btnProfileBar;
    
    UIButton *btnLogout=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnLogout setImage:[UIImage imageNamed:@"logoutButton"] forState:UIControlStateNormal];
    btnLogout.tintColor=[UIColor colorWithRed:255.0/255.0 green:129.0/255.0 blue:97.0/255.0 alpha:1.0];
    [btnLogout addTarget:self action:@selector(btnLogoutTap) forControlEvents:UIControlEventTouchUpInside];
    btnLogoutBar=[[UIBarButtonItem alloc]initWithCustomView:btnLogout];
    self.navigationItem.rightBarButtonItem=btnLogoutBar;
    UIImageView *ivBarLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_logo"]];
   
    ivBarLogo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=ivBarLogo;
}
-(void)btnProfileTap:(UIButton*)sender
{
     [self presentLeftMenuViewController:sender];
}
-(void)btnLogoutTap
{
    
}
@end
