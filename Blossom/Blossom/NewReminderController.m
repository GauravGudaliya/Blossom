//
//  NewReminderController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 10/6/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "NewReminderController.h"

@interface NewReminderController ()

@end

@implementation NewReminderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnEventAction:(id)sender {
    // Get the views dictionary
    
    EventView.frame=CGRectMake(EventView.frame.origin.x, EventView.frame.origin.y,EventView.frame.size.width, EventView.frame.size.height+110);
    AlertView.frame=CGRectMake(EventView.frame.origin.x, EventView.frame.size.height+5, AlertView.frame.size.width, AlertView.frame.size.height);
    AlertTimeView.frame=CGRectMake(AlertView.frame.origin.x, AlertView.frame.size.height+5, AlertTimeView.frame.size.width, AlertTimeView.frame.size.height);
}
@end
