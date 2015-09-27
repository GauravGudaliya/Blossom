//
//  OrderViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/25/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()
{
    UIBarButtonItem *btnBarOrder;
    UIBarButtonItem *btnBarTheme;
}
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self setUpNavigationBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUpNavigationBar
{
    UIButton *btnOrder=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnOrder setTitle:BTNORDER_TITLE forState:UIControlStateNormal];
    [btnOrder setImage:[UIImage imageNamed:@"menuIcon"] forState:UIControlStateNormal];
    [btnOrder setTitleColor:[UIColor colorWithRed:255.0/255.0 green:129.0/255.0 blue:97.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnOrder setFont:[UIFont fontWithName:FONT_REGULAR size:17]];
    [btnOrder addTarget:self action:@selector(btnOrderTap:) forControlEvents:UIControlEventTouchUpInside];
    btnBarOrder=[[UIBarButtonItem alloc]initWithCustomView:btnOrder];
    btnOrder.frame=CGRectMake(0, 0, 95, 35);
    self.navigationItem.leftBarButtonItem=btnBarOrder;
    
    UIButton *btnTheme=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnTheme setImage:[UIImage imageNamed:@"selectThemeIcon"] forState:UIControlStateNormal];
    btnTheme.frame=CGRectMake(0, 0, 40, 40);
    [btnTheme addTarget:self action:@selector(btnThemeTap:) forControlEvents:UIControlEventTouchUpInside];
    btnBarTheme=[[UIBarButtonItem alloc]initWithCustomView:btnTheme];
    self.navigationItem.rightBarButtonItem=btnBarTheme;
    
    UIImageView *ivBarLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_logo"]];
    ivBarLogo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=ivBarLogo;
}
-(void)btnOrderTap:(UIButton *)sender
{
    [self presentLeftMenuViewController:sender];
}
-(void)btnThemeTap:(UIButton *)sender
{
    ThemeViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ThemeViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
   
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     OrderDetailViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"OrderDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
@end
