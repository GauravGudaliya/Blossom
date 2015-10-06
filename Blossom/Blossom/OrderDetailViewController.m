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
    [SVProgressHUD show];
    PFQuery *query =[PFQuery queryWithClassName:@"Products"];
    [query whereKey:@"productCollection" equalTo: _collectionId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
          [SVProgressHUD dismiss];
         if (!error)
         {
             flowerArr=[[NSMutableArray alloc] initWithArray:objects];
             [_cvOrderDetail reloadData];
             _pcOrderDetail.numberOfPages=flowerArr.count;
         }
         else
         {
             [SVProgressHUD showErrorWithStatus:kSOME_ERROR];
         }
     }];
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [flowerArr count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailCell *cell = (OrderDetailCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFFile *userImageFile =[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"productImage"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            cell.ivFlowerImg.image = [UIImage imageWithData:imageData];
        }
    }];
    cell.lblFlowerHeader.text=[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"productTitle"];
    cell.lblFlowerSubHeader.text=[NSString stringWithFormat:@"AED%@",[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"price"]];
    cell.lblFlowerTitle.text=[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"productDetails"];
    cell.lblFlowerDesc.text=[[flowerArr objectAtIndex:indexPath.row] objectForKey:@"productDescription"];
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
