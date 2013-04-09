//
//  GameViewController.h
//  PhoneFlip
//
//  Created by Pranav on 3/22/13.
//  Copyright (c) 2013 goa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@class MenuViewController;
@class GameViewController;

@interface GameViewController : UIViewController
{
    CMMotionManager *motionManager;
}
- (IBAction)beginGame:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *goButton;
@property (strong, nonatomic) IBOutlet UIButton *shareToFacebook;
@property (strong, nonatomic) IBOutlet UIButton *shareToTwitter;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationBar;

@property (readonly) CMMotionManager *motionManager;
- (CMMotionManager *)motionManager;

@end
