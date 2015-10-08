//
//  PrivacyController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 10/6/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "PrivacyController.h"

@interface PrivacyController ()<YSLContainerViewControllerDelegate>
{
  UIBarButtonItem *btnBackBar;
}
@property (nonatomic,strong) YSLContainerViewController *containerVC;
@end

@implementation PrivacyController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setUpNavigationBar];
    
    [self addScrollMenu];
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
    
    UIImageView *ivBarLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_logo"]];
    
    ivBarLogo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=ivBarLogo;
}
-(void)btnBackTap
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)addScrollMenu
{
    
    [self.containerVC.view removeFromSuperview];
    
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height+30;
    
    self.containerVC = [[YSLContainerViewController alloc]initWithControllers:[self viewControllersForScrollView]
                                                                 topBarHeight:statusHeight + navigationHeight
                                                         parentViewController:self];
    self.containerVC.delegate = self;
    
    self.containerVC.menuItemFont = [UIFont fontWithName:FONT_REGULAR size:20];
    self.containerVC.menuItemTitleColor = kMENU_NORMAL_TEXT_COLOR;
    
    self.containerVC.menuItemSelectedTitleColor = kMENU_SELECTED_TEXT_COLOR;
    
    self.containerVC.menuIndicatorColor = kMENU_SELECTION_COLOR;
    self.containerVC.menuBackGroudColor = [UIColor clearColor];
    [self.view addSubview:self.containerVC.view];
    
       
}
-(NSMutableArray *)viewControllersForScrollView;
{
    NSMutableArray *vcs=[[NSMutableArray alloc] init];
    
    
    return vcs;
}
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller;
{
    if (index == 0) {
        
       
        
    }else
    {
       
        
    }
}

@end
