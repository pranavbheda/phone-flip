//
//  GameViewController.m
//  PhoneFlip
//
//  Created by Pranav on 3/22/13.
//  Copyright (c) 2013 goa. All rights reserved.
//

#import "GameViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@implementation GameViewController 
@synthesize backButton, goButton, shareToFacebook, shareToTwitter, navigationBar;

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
    
    //Configures the buttons
    [self editButton:self.backButton:       12.0f];
    [self editButton:self.goButton:         18.0f];
    [self editButton:self.shareToFacebook:  12.0f];
    [self editButton:self.shareToTwitter:   12.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Edit the buttons
-(void)editButton: (UIButton *)button : (float)fontSize
{
    // Set the button Background Color to clear
    [button setBackgroundColor:[UIColor blackColor]];
    
    // Set the font size
    [[button titleLabel] setFont:[UIFont fontWithName:@"Arial" size: fontSize]];
    
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
                                                           
- (CMMotionManager *)motionManager
{
    if(!motionManager)
        motionManager = [[CMMotionManager alloc] init];
    return motionManager;
}

- (IBAction)beginGame:(id)sender {
    NSLog(@"Game is beginning!");
    
    __block NSDate *startTime;
    
    __block float totalYawChange = 0;
    __block float flips = 0;
    
    __block float previousRoll = 0;
    __block float previousPitch = 0;
    __block float previousYaw = 0;
    __block BOOL started = NO;
    
    [[self motionManager] startDeviceMotionUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMDeviceMotion *data, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"%@", [NSString stringWithFormat:@"Roll %f", data.attitude.roll]);
//            NSLog(@"%@", [NSString stringWithFormat:@"Pitch %f", data.attitude.pitch]);
//            NSLog(@"%@", [NSString stringWithFormat:@"Yaw %f", data.attitude.yaw]);
            
            if (!started) {
                previousRoll = data.attitude.roll;
                previousPitch = data.attitude.pitch;
                previousYaw = data.attitude.yaw;
                startTime = [NSDate date];
                started = YES;
            }
            else {
                totalYawChange += fabsf(data.attitude.yaw - previousYaw);
                previousYaw = data.attitude.yaw;
                flips = floor(totalYawChange/12);
                self.rotationCount.text = [[NSString alloc] initWithFormat:@"%d", (int)flips];
            }
        });
    }];

}
- (void)viewDidUnload {
    [self setRotationCount:nil];
    [self setTimeLabel:nil];
    [super viewDidUnload];
}
@end
