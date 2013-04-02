//
//  MenuViewController.m
//  PhoneFlip
//
//  Created by Pranav on 3/21/13.
//  Copyright (c) 2013 goa. All rights reserved.
//

#import "MenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>



@implementation MenuViewController
@synthesize playMenuButton, scoresMenuButton, optionsMenuButton, menuView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }

    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self editButtons: self.playMenuButton];
    [self editButtons: self.scoresMenuButton];
    [self editButtons: self.optionsMenuButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

}

//Edit the buttons
-(void)editButtons: (UIButton *) button
{
    
    // Set the button Background Color to clear
    [button setBackgroundColor:[UIColor blackColor]];
    
    // Set the font
    [[button titleLabel] setFont:[UIFont fontWithName:@"Arial" size:18.0f]];
    
    // Rounds the edges
    CALayer *buttonLayer = [button layer];
    [buttonLayer setMasksToBounds: YES];
    [buttonLayer setCornerRadius: 10.0f];
    
    // 2 pixel, black border
    [buttonLayer setBorderWidth:2.0f];
    [buttonLayer setBorderColor:[[UIColor blackColor] CGColor]];
    
    // Set button colors for different states
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];

}

@end
