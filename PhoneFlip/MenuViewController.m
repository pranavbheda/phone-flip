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


@interface MenuViewController ()

@end


@implementation MenuViewController
@synthesize playMenuButton, scoresMenuButton, optionsMenuButton;

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
    
    [self changeColors: self.playMenuButton];
    [self changeColors: self.scoresMenuButton];
    [self changeColors: self.optionsMenuButton];
    
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

-(void)changeColors: (UIButton *) button
{
    
    // Set the button Background Color to clear
    [button setBackgroundColor:[UIColor blackColor]];
    
    // Set the font
    [[button titleLabel] setFont:[UIFont fontWithName:@"Arial" size:18.0f]];

    
    // Rounds the edges
    CALayer *buttonLayer = [button layer];
    [buttonLayer setMasksToBounds: YES];
    [buttonLayer setCornerRadius: 5.0f];    
    
    // 2 pixel, black border
    [buttonLayer setBorderWidth:2.0f];
    [buttonLayer setBorderColor:[[UIColor darkGrayColor] CGColor]];

    
    
    // Set button colors for different states
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
   

}



@end
