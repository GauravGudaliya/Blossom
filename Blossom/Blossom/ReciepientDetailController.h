//
//  ReciepientDetailController.h
//  demoBlosom
//
//  Created by Prashant on 10/8/15.
//  Copyright (c) 2015 Prudent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReciepientDetailController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tblView;

@end
