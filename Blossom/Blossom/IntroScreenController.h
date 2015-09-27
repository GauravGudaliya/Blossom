//
//  ViewController.h
//  Blossom
//
//  Created by Darshan Patel on 21/09/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface IntroScreenController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) IBOutlet UICollectionView *cvIntro;
@property (nonatomic,strong) IBOutlet UILabel *lblHours;
@property (nonatomic,strong) IBOutlet UIButton *btnSwipe;

@property (nonatomic,strong) IBOutlet UIButton *btnNext;
@property (nonatomic,strong) IBOutlet UIPageControl *pcIntro;
@property (nonatomic,strong) IBOutlet UIImageView *imgLogoSmall;
@end

