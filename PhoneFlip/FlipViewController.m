//
//  FlipViewController.m
//  PhoneFlip
//
//  Created by Pranav on 3/17/13.
//  Copyright (c) 2013 goa. All rights reserved.
//

#import "FlipViewController.h"

@interface FlipViewController ()

@end

@implementation FlipViewController

@synthesize motionHistory;

- (CMMotionManager *)motionManager
{
    if(!motionManager)
        motionManager = [[CMMotionManager alloc] init];
    return motionManager;
}

- (void)detectFlips
{
    [[self motionManager] startDeviceMotionUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMDeviceMotion *data, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.roll.text = [NSString stringWithFormat:@"%f", data.attitude.roll];
            self.pitch.text = [NSString stringWithFormat:@"%f", data.attitude.pitch];
            self.yaw.text = [NSString stringWithFormat:@"%f", data.attitude.yaw];
            
            [self.motionHistory addObject:data.attitude];
            self.spinLabel.text = [NSString stringWithFormat:@"Reads: %d", [self.motionHistory count]];
        });
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self detectFlips];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSpinLabel:nil];
    [super viewDidUnload];
}
@end
