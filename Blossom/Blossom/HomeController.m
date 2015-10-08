//
//  HomeController.m
//  Blossom
//
//  Created by Darshan Patel on 04/10/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()<YSLContainerViewControllerDelegate>
{
    UIBarButtonItem *btnBarOrder;
    UIBarButtonItem *btnBarTheme;
    
}
@property (nonatomic,strong) YSLContainerViewController *containerVC;
@property (nonatomic,strong) NSMutableArray *arrOccasions;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavigationBar];
    
    [self fetchOccasionFromLocal];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    
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
    [btnOrder.titleLabel setFont:[UIFont fontWithName:FONT_REGULAR size:17]];
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


-(void)fetchCountFromServer:(int)localCount
{
    [SVProgressHUD show];
    PFQuery *themeColorQuery=[PFQuery queryWithClassName:kOCCASION_CLASS];
    [themeColorQuery countObjectsInBackgroundWithBlock:^(int number, NSError * error)
     {
         
         [SVProgressHUD dismiss];
         if (!error) {
             if (number != localCount) {
                 [self fetchOccasionsFromParse];
             }
         }
         
     }];
    
}
-(void)fetchOccasionFromLocal
{
    [SVProgressHUD show];
    
    PFQuery *query =[PFQuery queryWithClassName:kOCCASION_CLASS];
    [query fromLocalDatastore];
    [query orderByAscending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         [SVProgressHUD dismiss];
         
         if (!error)
         {
             if (objects.count!=0) {
                
                 [self fetchCountFromServer:objects.count];
                 
                 self.arrOccasions=[[NSMutableArray alloc] initWithArray:objects];
               
                 [self addScrollMenu];
                 
             }else
             {
                 [self fetchOccasionsFromParse];
             }
             
         }
         else
         {
             [SVProgressHUD showErrorWithStatus:kSOME_ERROR];
         }
     }];
    
}
-(void)fetchOccasionsFromParse
{
    [SVProgressHUD show];
    
    PFQuery *query =[PFQuery queryWithClassName:kOCCASION_CLASS];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         [SVProgressHUD dismiss];
         
         if (!error)
         {
             NSError *error;
             BOOL done=[PFObject pinAll:objects error:&error];
             
             NSLog(@"%@",error.localizedDescription);
             
            self.arrOccasions=[[NSMutableArray alloc] initWithArray:objects];
             
             [self addScrollMenu];
         }
         else
         {
             [SVProgressHUD showErrorWithStatus:kSOME_ERROR];
         }
     }];

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
    
    self.containerVC.menuItemFont = [UIFont fontWithName:FONT_REGULAR size:24];
    self.containerVC.menuItemTitleColor = kMENU_NORMAL_TEXT_COLOR;
    
    self.containerVC.menuItemSelectedTitleColor = kMENU_SELECTED_TEXT_COLOR;
    
    self.containerVC.menuIndicatorColor = kMENU_SELECTION_COLOR;
    self.containerVC.menuBackGroudColor = [UIColor clearColor];
    [self.view addSubview:self.containerVC.view];
    
    [self fetchViewAllRecods];
    
}
-(NSMutableArray *)viewControllersForScrollView;
{
    NSMutableArray *vcs=[[NSMutableArray alloc] init];
    
    for (int i=0; i<[self.arrOccasions count]+1; i++) {
        
        if (i==0) {
            OrderViewController *order = [self.storyboard instantiateViewControllerWithIdentifier:@"OrderViewController"];
            
            order.title = @"View All";
            
            [vcs addObject:order];
        }else
        {
            OrderViewController *order = [self.storyboard instantiateViewControllerWithIdentifier:@"OrderViewController"];
            
            PFObject *occasion=self.arrOccasions[i-1];
            order.title = [occasion objectForKey:@"occasionName"];
            
            [vcs addObject:order];
        }
        
    }
    
    return vcs;
}

-(void)fetchViewAllRecods
{
    OrderViewController *orderVc =self.containerVC.childControllers[0];
    
    [orderVc fetchCollections:nil];
    
}
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller;
{
    if (index == 0) {
        
        OrderViewController *orderVc =(OrderViewController *)controller;
        [orderVc fetchCollections:nil];
        
    }else
    {
        OrderViewController *orderVc =(OrderViewController *)controller;
        PFObject *occasion = self.arrOccasions[index -1];
        [orderVc fetchCollections:occasion];
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
