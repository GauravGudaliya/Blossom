//
//  ViewController.m
//  Blossom
//
//  Created by Darshan Patel on 21/09/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "IntroScreenController.h"

@interface IntroScreenController ()<UIScrollViewDelegate>
@property (nonatomic,assign) NSInteger currentIndex;
@end

@implementation IntroScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    [self collectionViewInitializations];
    
    self.lblHours.hidden = YES;
    self.imgLogoSmall.hidden = YES;
    
    self.currentIndex =0;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)collectionViewInitializations
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    if (IS_IPHONE_5) {
        
        [flowLayout setItemSize:CGSizeMake(276, 368)];
        
    }else if(IS_IPHONE_6)
    {
        [flowLayout setItemSize:CGSizeMake(331, 467)];
    }
    else if(IS_IPHONE_6P)
    {
        [flowLayout setItemSize:CGSizeMake(370, 536)];
    }else
    {
        [flowLayout setItemSize:CGSizeMake(276, 368)];
    }
    [flowLayout setSectionInset:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    [flowLayout setMinimumLineSpacing:0.0];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.cvIntro setCollectionViewLayout:flowLayout];
    
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IntroCell *cell = (IntroCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"IntroCell" forIndexPath:indexPath];
    
    if(indexPath.row == 0)
    {
        cell.imgIntro.image =[UIImage imageNamed:@""];
        cell.vwCellBack.backgroundColor =[UIColor clearColor];
        cell.lblText.text = @"";
        cell.lblTitle.text = @"";
        
        
    }else if(indexPath.row == 1)
    {
        cell.imgIntro.image =[UIImage imageNamed:@"intro_2"];
        cell.vwCellBack.backgroundColor =[UIColor whiteColor];
        cell.lblText.text = INTRO2_TEXT;
        cell.lblTitle.text = INTRO2_TITLE;
        
        
    }else if(indexPath.row == 2)
    {
        cell.imgIntro.image =[UIImage imageNamed:@"intro_3"];
        cell.vwCellBack.backgroundColor =[UIColor whiteColor];
        cell.lblText.text = INTRO3_TEXT;
        cell.lblTitle.text = INTRO3_TITLE;
    }
    return cell;
}

//----------------------------BUTTON TAP EVENTS --------------------
-(IBAction)btnNext_Tapped:(id)sender
{
    self.currentIndex ++;

    if (self.currentIndex==3)
    {
        SideBarController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"SideBarController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        [self.cvIntro scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        
        [self showControlsWhilePagging];
    }
}
//----------------------------CALLED WHILE PAGGING --------------------
-(void)showControlsWhilePagging
{
    self.pcIntro.currentPage = self.currentIndex;
    
    if (self.currentIndex == 2) {
        
        self.imgLogoSmall.hidden = NO;
        [self.btnNext setTitle:GET_STARTED_TITLE forState:UIControlStateNormal];
        
    }else if(self.currentIndex == 1)
    {
        self.imgLogoSmall.hidden = NO;
        [self.btnNext setTitle:NEXT_TITLE forState:UIControlStateNormal];
        
    }else if(self.currentIndex == 0)
    {
        self.imgLogoSmall.hidden = NO;
        [self.btnNext setTitle:NEXT_TITLE forState:UIControlStateNormal];
    }
    
}
//----------------------------SCROLLVIEW DELEGATE--------------------------
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentIndex = self.cvIntro.contentOffset.x / self.cvIntro.frame.size.width;
    
    self.currentIndex =currentIndex;
    
    [self showControlsWhilePagging];
    
}
@end
