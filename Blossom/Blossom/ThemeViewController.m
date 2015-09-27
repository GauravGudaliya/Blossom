//
//  ThemeViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/26/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "ThemeViewController.h"

@interface ThemeViewController ()
{
    UIBarButtonItem *btnBackBar;
}
@end

@implementation ThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        
}
-(void)btnBackTap
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
