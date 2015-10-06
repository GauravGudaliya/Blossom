//
//  OrderHistoryViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/26/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "OrderHistoryViewController.h"
#import "Header.h"

@interface OrderHistoryViewController ()
{
    UIBarButtonItem *btnHistoryBar;
    UIBarButtonItem *btnClearAllBar;
}
@end

@implementation OrderHistoryViewController

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
    UIButton *btnOrderHistory=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnOrderHistory setTitle:BTNORDER_HISTORY forState:UIControlStateNormal];
    [btnOrderHistory setImage:[UIImage imageNamed:@"menuIcon"] forState:UIControlStateNormal];
    [btnOrderHistory setTitleColor:[UIColor colorWithRed:255.0/255.0 green:129.0/255.0 blue:97.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnOrderHistory setFont:[UIFont fontWithName:FONT_REGULAR size:17]];
    [btnOrderHistory addTarget:self action:@selector(btnOrderHistoryTap:) forControlEvents:UIControlEventTouchUpInside];
    
    btnHistoryBar=[[UIBarButtonItem alloc]initWithCustomView:btnOrderHistory];
    btnOrderHistory.frame=CGRectMake(0, 0, 95, 35);
    self.navigationItem.leftBarButtonItem=btnHistoryBar;
    
    UIButton *btnClearAll=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnClearAll setTitle:
                 BTNCLEAR_ALL forState:UIControlStateNormal];
    [btnClearAll setTitleColor:[UIColor colorWithRed:255.0/255.0 green:129.0/255.0 blue:97.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnClearAll setFont:[UIFont fontWithName:FONT_REGULAR size:17]];
    [btnClearAll addTarget:self action:@selector(btnClearAllTap) forControlEvents:UIControlEventTouchUpInside];
    
    btnClearAllBar=[[UIBarButtonItem alloc]initWithCustomView:btnClearAll];
    btnClearAll.frame=CGRectMake(0, 0, 95, 35);
    self.navigationItem.rightBarButtonItem=btnClearAllBar;
    
    UIImageView *ivBarLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_logo"]];
   
    ivBarLogo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=ivBarLogo;
}
-(void)btnOrderHistoryTap:(UIButton *)sender
{
    [self presentLeftMenuViewController:sender];
}
-(void)btnClearAllTap
{

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderHistoryCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    return cell;
}

@end
