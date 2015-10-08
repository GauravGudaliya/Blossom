//
//  PersonalMessageController.h
//  Blossom
//
//  Created by Krunal Kevadiya on 10/8/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
@interface PersonalMessageController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *txtMsg;
@property (weak, nonatomic) IBOutlet UITextField *txtSalutation;
@property (weak, nonatomic) IBOutlet UILabel *lblCounter;

@end
