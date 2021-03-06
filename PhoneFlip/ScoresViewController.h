//
//  ScoresViewController.h
//  PhoneFlip
//
//  Created by Pranav on 3/29/13.
//  Copyright (c) 2013 goa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoresViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UITextView *scoresTextView;
@property (strong, nonatomic) IBOutlet UITableView *scoreData;
@property (strong, nonatomic) IBOutlet UIScrollView *gameData;

@property NSMutableArray *scores;

@end
