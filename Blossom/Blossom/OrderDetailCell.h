//
//  OrderDetailCell.h
//  Blossom
//
//  Created by Krunal Kevadiya on 9/27/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface OrderDetailCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ivFlowerImg;
@property (weak, nonatomic) IBOutlet UILabel *lblFlowerHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblFlowerSubHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblFlowerTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblFlowerDesc;
@property (weak, nonatomic) IBOutlet UIButton *btnSelectFlower;

@end
