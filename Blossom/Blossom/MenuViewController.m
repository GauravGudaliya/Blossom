//
//  MenuViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/25/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "MenuViewController.h"
#import "Strings.h"
#import "Header.h"

@interface MenuViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *menuIcons;
    NSMutableArray *menuNames;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    menuIcons=[[NSMutableArray alloc]initWithObjects:@"orderIcon",@"orderHistoryIcon",@"profileIcon",@"getInTouchIcon", nil];
    menuNames=[[NSMutableArray alloc]initWithObjects:FIRST_MENUITEM,SECOND_MENUITEM,THIRD_MENUITEM,FOURTH_MENUITEM, nil];
    _tblMenu.opaque = NO;
    _tblMenu.backgroundColor = [UIColor clearColor];
    _tblMenu.backgroundView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return menuNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.ivMenuIcon.image=[UIImage imageNamed:[menuIcons objectAtIndex:indexPath.row]];
    cell.lbMenuName.text=[menuNames objectAtIndex:indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
       [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"OrderViewController"]]
                                                     animated:YES];
        [self.sideMenuViewController hideMenuViewController];
    }
    else if(indexPath.row==1)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"OrderHistoryViewController"]]
                                                     animated:YES];
        [self.sideMenuViewController hideMenuViewController];
    }
    else if(indexPath.row==2)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"]]
                                                     animated:YES];
        [self.sideMenuViewController hideMenuViewController];
    }
    else if(indexPath.row==3)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"GetInTouchViewController"]]
                                                     animated:YES];
        [self.sideMenuViewController hideMenuViewController];
    }

}
@end
