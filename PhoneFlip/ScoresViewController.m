//
//  ScoresViewController.m
//  PhoneFlip
//
//  Created by Pranav on 3/29/13.
//  Copyright (c) 2013 goa. All rights reserved.
//

#import "ScoresViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "Player.h"

@interface ScoresViewController ()
@end

@interface Player()
@end

@implementation ScoresViewController
@synthesize menuButton, scoresTextView, scores, scoreData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self editButtons: self.menuButton];
    NSLog(@"Buttons are initliazed");
 
    NSLog(@"------------------------------");
    [self firstInit];
    [self initializeScores: self.scoresTextView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)editButtons: (UIButton *) button;
{
    // Set the button Background Color to clear
    [button setBackgroundColor:[UIColor blackColor]];
    
    // Set the font
    [[button titleLabel] setFont:[UIFont fontWithName:@"Arial" size:18.0f]];
    
    // Rounds the edges
    CALayer *buttonLayer = [button layer];
    [buttonLayer setMasksToBounds: YES];
    [buttonLayer setCornerRadius: 9.0f];
    
    // 2 pixel, black border
    [buttonLayer setBorderWidth:2.0f];
    [buttonLayer setBorderColor:[[UIColor blackColor] CGColor]];
    
    // Set button colors for different states
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
}








-(void) initializeScores:(UITextView *) textView;
{
    [textView setFont:[UIFont fontWithName:@"Arial" size:20.0f]];
    textView.text =     @" Name \t\t\t Score";
    

    for(int index = 0; index < [scores count]; index ++)
    {
        Player *temp = [scores objectAtIndex: index];
        [textView setText:[NSString stringWithFormat:@"%@ \n %@ \t\t\t %d", textView.text, [temp name], [temp score]]];
        
    }
}


-(void) firstInit
{
    scores = [NSMutableArray arrayWithObjects: nil];
    for(int index = 0; index < 10; index ++)
    {
        Player *player = [[Player alloc] init];
        NSString *tempName = @"Player";
        [player setName: tempName];
        player.score = (index + 1);
        [scores addObject: player];
    }
    
    
    [scores writeToFile:@"Data.plist" atomically:YES];
}

- (void)viewDidUnload {
    [self setGameData:nil];
    [super viewDidUnload];
}





















@end
