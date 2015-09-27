//
//  IntroCell.h
//  KindVisitor
//
//  Created by Darshan Patel on 04/09/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface IntroCell : UICollectionViewCell
@property(nonatomic,strong) IBOutlet UIImageView *imgIntro;
@property(nonatomic,strong) IBOutlet UILabel *lblTitle;
@property(nonatomic,strong) IBOutlet UILabel *lblText;
@property(nonatomic,strong) IBOutlet UIView *vwCellBack;
@end
