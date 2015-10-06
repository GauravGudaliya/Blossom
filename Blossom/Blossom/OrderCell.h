//
//  OrderCell.h
//  Blossom
//
//  Created by Krunal Kevadiya on 9/26/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbShop;
@property (weak, nonatomic) IBOutlet UILabel *lbFlowerName;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@property (weak, nonatomic) IBOutlet UIImageView *ivFlowerImage;
@end
