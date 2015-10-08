//
//  NewReminderController.h
//  Blossom
//
//  Created by Krunal Kevadiya on 10/6/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewReminderController : UIViewController{
    
    __weak IBOutlet UIButton *btnEventObj;
    __weak IBOutlet UIView *MainView;
    __weak IBOutlet UIView *AlertTimeView;
    __weak IBOutlet UIView *AlertView;
    __weak IBOutlet UIView *EventView;
}
- (IBAction)btnEventAction:(id)sender;

@end
