//
//  OrderDetailViewController.h
//  Blossom
//
//  Created by Krunal Kevadiya on 9/27/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface OrderDetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *cvOrderDetail;
@property (weak, nonatomic) IBOutlet UIPageControl *pcOrderDetail;

- (IBAction)btnBackTap:(UIButton *)sender;

@end
