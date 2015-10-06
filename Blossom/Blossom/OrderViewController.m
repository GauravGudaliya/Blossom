//
//  OrderViewController.m
//  Blossom
//
//  Created by Darshan Patel on 9/25/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()
{
    UIBarButtonItem *btnBarOrder;
    UIBarButtonItem *btnBarTheme;
    NSMutableArray *collectionArr;
}
@end

@implementation OrderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
   // [self setUpNavigationBar];
   // [self fetchCollections:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchCollections:(PFObject *)occasionId
{
    [SVProgressHUD show];
    
    PFQuery *query =[PFQuery queryWithClassName:@"Collection"];
    
    if (occasionId) {
        [query whereKey:@"occasionId" equalTo: occasionId];
    }
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         [SVProgressHUD dismiss];
         
         if (!error)
         {
             collectionArr=[[NSMutableArray alloc] initWithArray:objects];
             [self.tblOrderView reloadData];
             
         }
         else
         {
             [SVProgressHUD showErrorWithStatus:kSOME_ERROR];
         }
     }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return collectionArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];

    cell.lbFlowerName.text=[[collectionArr objectAtIndex:indexPath.row] objectForKey:@"collectionTitle"];
    PFObject *item = collectionArr[indexPath.row];
    NSString *searchTerm = item.objectId;
    PFFile *userImageFile =[[collectionArr objectAtIndex:indexPath.row]objectForKey:@"collectionCoverImage"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
             cell.ivFlowerImage.image = [UIImage imageWithData:imageData];
        }
    }];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     OrderDetailViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"OrderDetailViewController"];
    PFObject *item = collectionArr[indexPath.row];
    vc.collectionId=item;
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
@end
