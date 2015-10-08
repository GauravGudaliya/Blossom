//
//  PersonalMessageController.m
//  Blossom
//
//  Created by Krunal Kevadiya on 10/8/15.
//  Copyright (c) 2015 Hype Ten. All rights reserved.
//

#import "PersonalMessageController.h"

@interface PersonalMessageController ()<UITextFieldDelegate,UITextViewDelegate>
{
    UIBarButtonItem *btnBackBar;
    UIBarButtonItem *btnSkipBar;
}
@end

@implementation PersonalMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self setUpNavigationBar];
    
    _txtMsg.text=@"Write your message here";
    _txtMsg.textColor=[UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpNavigationBar
{
    UIButton *btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnBack setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [btnBack setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btnBack.frame=CGRectMake(0, 0, 40, 40);
    [btnBack addTarget:self action:@selector(btnBackTap) forControlEvents:UIControlEventTouchUpInside];
    btnBackBar=[[UIBarButtonItem alloc]initWithCustomView:btnBack];
    self.navigationItem.leftBarButtonItem=btnBackBar;

    UIButton *btnSkip=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnSkip setTitle:
     BTNSKIP forState:UIControlStateNormal];
    [btnSkip setTitleColor:[UIColor colorWithRed:255.0/255.0 green:129.0/255.0 blue:97.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnSkip setFont:[UIFont fontWithName:FONT_REGULAR size:17]];
    [btnSkip addTarget:self action:@selector(btnSkipTap) forControlEvents:UIControlEventTouchUpInside];
    btnSkipBar=[[UIBarButtonItem alloc]initWithCustomView:btnSkip];
    btnSkip.frame=CGRectMake(0, 0, 95, 35);
    self.navigationItem.rightBarButtonItem=btnSkipBar;
    
    UIImageView *ivBarLogo=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_logo"]];
    ivBarLogo.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView=ivBarLogo;
}
-(void)btnSkipTap
{
    ReciepientDetailController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ReciepientDetailController"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)btnBackTap
{
    self.navigationController.navigationBarHidden=YES;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Write your message here"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [textView becomeFirstResponder];
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Write your message here";
        textView.textColor = [UIColor lightGrayColor];
    }
    [textView resignFirstResponder];
}
- (void)textViewDidChange:(UITextView *)textView{
    
    NSInteger restrictedLength=150;
    
    NSString *temp=textView.text;
    
    if([[textView text] length] > restrictedLength){
        textView.text=[temp substringToIndex:[temp length]-1];
    }
    _lblCounter.text=[NSString stringWithFormat:@"%lu/150",150-[textView text].length];
}
- (IBAction)btnNextAction:(id)sender
{
    ReciepientDetailController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ReciepientDetailController"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
