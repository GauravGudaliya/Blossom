//
//  OrderHistoryViewController.h
//  Blossom
//
//  Created by Krunal Kevadiya on 9/26/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderHistoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewNoOrder;
@property (weak, nonatomic) IBOutlet UITableView *tblOrderHistory;

@end
