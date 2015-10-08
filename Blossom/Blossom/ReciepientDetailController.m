//
//  ReciepientDetailController.m
//  demoBlosom
//
//  Created by Prashant on 10/8/15.
//  Copyright (c) 2015 Prudent. All rights reserved.
//

#import "ReciepientDetailController.h"
#import "Header.h"
@interface ReciepientDetailController ()
{
    UIBarButtonItem *btnBackBar;
}
@end

@implementation ReciepientDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
    if(IS_IPHONE_4_OR_LESS)
    {
        _tblView.scrollEnabled=YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    return Cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(IS_IPHONE_6)
    {
        return 500;
    
    }
    else
    {
        return 450;
    }
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
