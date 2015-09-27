//
//  OrderDetailViewController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 9/27/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "OrderDetailViewController.h"

@interface OrderDetailViewController ()<UIScrollViewDelegate>
{
    NSMutableArray *flowerArr;
}
@property (nonatomic,assign) NSInteger currentIndex;
@end

@implementation OrderDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.currentIndex =0;
    [self collectionViewInitializations];
    
    flowerArr =[NSMutableArray array];
    
    for (int i=0; i<4; i++)
    {
        NSMutableDictionary *flowerDict=[NSMutableDictionary dictionary];
        
        [flowerDict setObject:@"noOrdersImage.png" forKey:@"flowerImg"];
        [flowerDict setObject:@"The Cooper" forKey:@"flowerHeader"];
        [flowerDict setObject:@"AED250" forKey:@"flowerSubHeader"];
        [flowerDict setObject:@"12 red roses and 15 white roses" forKey:@"flowerTitle"];
        [flowerDict setObject:@"flower are perfect for everyone again flower are perfect for everyone" forKey:@"flowerDesc"];
        [flowerArr addObject:flowerDict];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [flowerArr count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailCell *cell = (OrderDetailCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.ivFlowerImg.image=[UIImage imageNamed:[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"flowerImg"]];
    cell.lblFlowerHeader.text=[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"flowerHeader"];
    cell.lblFlowerSubHeader.text=[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"flowerSubHeader"];
    cell.lblFlowerTitle.text=[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"flowerTitle"];
    cell.lblFlowerDesc.text=[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"flowerDesc"];
    return cell;
}
//----------------------------CALLED WHILE PAGGING --------------------
-(void)showControlsWhilePagging
{
    self.pcOrderDetail.currentPage = self.currentIndex;
}
//----------------------------SCROLLVIEW DELEGATE--------------------------
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentIndex = self.cvOrderDetail.contentOffset.x / self.cvOrderDetail.frame.size.width;
    self.currentIndex =currentIndex;
    [self showControlsWhilePagging];
}
-(void)collectionViewInitializations
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    if (IS_IPHONE_5) {
        
         [flowLayout setItemSize:CGSizeMake(320, 520)];
        
    }else if(IS_IPHONE_6)
    {
        [flowLayout setItemSize:CGSizeMake(375, 620)];
    }
    else if(IS_IPHONE_6P)
    {
        [flowLayout setItemSize:CGSizeMake(414, 690)];
    }else
    {
        [flowLayout setItemSize:CGSizeMake(320, 430)];
    }
    
    [flowLayout setSectionInset:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    [flowLayout setMinimumLineSpacing:0.0];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.cvOrderDetail setCollectionViewLayout:flowLayout];
    
}
- (IBAction)btnBackTap:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}
@end
