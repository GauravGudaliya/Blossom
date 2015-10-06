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
    [self fetchColorsFromLocal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchcolorsFromServer
{
    [SVProgressHUD show];
    
    PFQuery *themeColorQuery=[PFQuery queryWithClassName:@"Color"];
    [themeColorQuery orderByAscending:@"Order"];
    [themeColorQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         [SVProgressHUD dismiss];
         
         if (!error) {
             if (objects.count!=0) {
                 [PFObject pinAll:objects];
                 [self addTheame:objects];
             }
             
         }
         
     }];
}
-(void)fetchCountFromServer:(int)localCount
{
    PFQuery *themeColorQuery=[PFQuery queryWithClassName:@"Color"];
    [themeColorQuery orderByAscending:@"Order"];
    [themeColorQuery countObjectsInBackgroundWithBlock:^(int number, NSError * error)
     {
         if (!error) {
             if (number != localCount) {
                 [self fetchcolorsFromServer];
             }
         }
         
     }];
    
}
-(void)fetchColorsFromLocal
{
    PFQuery *themeColorQuery=[PFQuery queryWithClassName:@"Color"];
    [themeColorQuery orderByAscending:@"Order"];
    [themeColorQuery fromLocalDatastore];
    [themeColorQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if (!error) {
             if (objects.count!=0) {
                 
                 [self addTheame:objects];
                 [self fetchCountFromServer:objects.count];
             }else
             {
                 [self fetchcolorsFromServer];
             }
         }
     }];
}
-(void)addTheame:(NSArray *)objects
{
    for (int i=0; i<[objects count]; i++) {
        
        PFObject *theme =[objects objectAtIndex:i];
        
        if (i==0) {
            
            UIButton *btnRed =[UIButton buttonWithType:UIButtonTypeCustom];
            btnRed.frame = CGRectMake(0, 0, [theme[@"size"] floatValue], [theme[@"size"] floatValue]);
            btnRed.center = CGPointMake(self.view.center.x, (self.view.center.y+35));
            [btnRed setBackgroundColor:[UIColor colorFromHexString:[NSString stringWithFormat:@"#%@",theme[@"colorHex"]]]];
            [btnRed.layer setCornerRadius:[theme[@"size"] floatValue]/2];
            [self.view addSubview:btnRed];
            
            
        }else if(i==1)
        {
            UIButton *btnRed =[UIButton buttonWithType:UIButtonTypeCustom];
            btnRed.frame = CGRectMake(self.view.center.x -[theme[@"size"] floatValue]*1.7 , (self.view.center.y+35) -([theme[@"size"] floatValue]), [theme[@"size"] floatValue], [theme[@"size"] floatValue]);
            
            [btnRed setBackgroundColor:[UIColor colorFromHexString:[NSString stringWithFormat:@"#%@",theme[@"colorHex"]]]];
            [btnRed.layer setCornerRadius:[theme[@"size"] floatValue]/2];
            [self.view addSubview:btnRed];
        }
        
        
        else if(i==2)
        {
            UIButton *btnRed =[UIButton buttonWithType:UIButtonTypeCustom];
            btnRed.frame = CGRectMake(self.view.center.x +([theme[@"size"] floatValue]/2) , (self.view.center.y+35) +([theme[@"size"] floatValue]/2), [theme[@"size"] floatValue], [theme[@"size"] floatValue]);
            
            [btnRed setBackgroundColor:[UIColor colorFromHexString:[NSString stringWithFormat:@"#%@",theme[@"colorHex"]]]];
            [btnRed.layer setCornerRadius:[theme[@"size"] floatValue]/2];
            [self.view addSubview:btnRed];
        }
        
        else if(i==3)
        {
            UIButton *btnRed =[UIButton buttonWithType:UIButtonTypeCustom];
            btnRed.frame = CGRectMake(self.view.center.x -[theme[@"size"] floatValue] , (self.view.center.y+35) +([theme[@"size"] floatValue]), [theme[@"size"] floatValue], [theme[@"size"] floatValue]);
            
            [btnRed setBackgroundColor:[UIColor colorFromHexString:[NSString stringWithFormat:@"#%@",theme[@"colorHex"]]]];
            [btnRed.layer setCornerRadius:[theme[@"size"] floatValue]/2];
            [self.view addSubview:btnRed];
        }
        
        else if(i==4)
        {
            UIButton *btnRed =[UIButton buttonWithType:UIButtonTypeCustom];
            btnRed.frame = CGRectMake(self.view.center.x+[theme[@"size"] floatValue], (self.view.center.y+35) -([theme[@"size"] floatValue]), [theme[@"size"] floatValue], [theme[@"size"] floatValue]);
            
            [btnRed setBackgroundColor:[UIColor colorFromHexString:[NSString stringWithFormat:@"#%@",theme[@"colorHex"]]]];
            [btnRed.layer setCornerRadius:[theme[@"size"] floatValue]/2];
            [self.view addSubview:btnRed];
        }
        
        else if(i==5)
        {
            UIButton *btnRed =[UIButton buttonWithType:UIButtonTypeCustom];
            btnRed.frame = CGRectMake(self.view.center.x, (self.view.center.y+35) -([theme[@"size"] floatValue]*2.5), [theme[@"size"] floatValue], [theme[@"size"] floatValue]);
            
            [btnRed setBackgroundColor:[UIColor colorFromHexString:[NSString stringWithFormat:@"#%@",theme[@"colorHex"]]]];
            [btnRed.layer setCornerRadius:[theme[@"size"] floatValue]/2];
            [self.view addSubview:btnRed];
        }
        else if(i==6)
        {
            UIButton *btnRed =[UIButton buttonWithType:UIButtonTypeCustom];
            btnRed.frame = CGRectMake(self.view.center.x-([theme[@"size"] floatValue]*2.5), (self.view.center.y+35) +([theme[@"size"] floatValue]), [theme[@"size"] floatValue], [theme[@"size"] floatValue]);
            
            [btnRed setBackgroundColor:[UIColor colorFromHexString:[NSString stringWithFormat:@"#%@",theme[@"colorHex"]]]];
            [btnRed.layer setCornerRadius:[theme[@"size"] floatValue]/2];
            [self.view addSubview:btnRed];
        }
        
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
