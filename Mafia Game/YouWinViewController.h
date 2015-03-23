//
//  YouWinViewController.h
//  Mafia Game
//
//  Created by Zachary Mallicoat on 3/23/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiniGame.h"

@interface YouWinViewController : UIViewController

@property (strong, nonatomic) MiniGame *gameStatus;
@property (strong, nonatomic) IBOutlet UILabel *winReason;

@end
