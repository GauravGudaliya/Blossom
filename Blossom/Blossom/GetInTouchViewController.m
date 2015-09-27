//
//  GetInTouchViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/27/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "GetInTouchViewController.h"
#import "Header.h"
@interface GetInTouchViewController ()
{
    UIBarButtonItem *btnGetInTouchBar;
}
@end

@implementation GetInTouchViewController

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
    UIButton *btnGetInTouch=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnGetInTouch setTitle:BTNGETINTOUCH forState:UIControlStateNormal];
    [btnGetInTouch setImage:[UIImage imageNamed:@"menuIcon"] forState:UIControlStateNormal];
    [btnGetInTouch setTitleColor:[UIColor colorWithRed:255.0/255.0 green:129.0/255.0 blue:97.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnGetInTouch setFont:[UIFont fontWithName:FONT_REGULAR size:17]];
    [btnGetInTouch addTarget:self action:@selector(btnGetInTouchTap:) forControlEvents:UIControlEventTouchUpInside];
    btnGetInTouchBar=[[UIBarButtonItem alloc]initWithCustomView:btnGetInTouch];
    btnGetInTouch.frame=CGRectMake(0, 0, 140, 35);
    self.navigationItem.leftBarButtonItem=btnGetInTouchBar;
    
    UIImageView *ivBarLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_logo"]];
   
    ivBarLogo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=ivBarLogo;
}
-(void)btnGetInTouchTap:(UIButton*)sender
{
    [self presentLeftMenuViewController:sender];
}
@end
