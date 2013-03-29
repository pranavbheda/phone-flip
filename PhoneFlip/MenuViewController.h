//
//  MenuViewController.h
//  PhoneFlip
//
//  Created by Pranav on 3/21/13.
//  Copyright (c) 2013 goa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController {
    UIViewController *gameView;
}

@property (nonatomic, retain) IBOutlet UINavigationController *navController;
- (IBAction)goToGameView:(id)sender;

//@property (nonatomic, retain) GameViewController *gameView;


@property MenuViewController *menuView;
@property (strong, nonatomic) IBOutlet UIButton *playMenuButton;
@property (strong, nonatomic) IBOutlet UIButton *scoresMenuButton;
@property (strong, nonatomic) IBOutlet UIButton *optionsMenuButton;


@end
