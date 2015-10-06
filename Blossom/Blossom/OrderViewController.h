//
//  OrderViewController.h
//  Blossom
//
//  Created by Darshan Patel on 9/25/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import <Parse/Parse.h>

@interface OrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
}
@property (nonatomic,strong) IBOutlet UITableView *tblOrderView;
@property (nonatomic,strong)PFObject *occasionId;
-(void)fetchCollections:(PFObject *)occasionId;
@end
