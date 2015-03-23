//
//  GameOverViewController.h
//  Mafia Game
//
//  Created by Zachary Mallicoat on 3/23/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MafiaViewController.h"
#import "SheriffViewController.h"

@interface GameOverViewController : UIViewController

@property (strong, nonatomic) MiniGame *gameStatus;
@property (strong, nonatomic) SheriffViewController *sheriffStatus;
@property (strong, nonatomic) MafiaViewController *mafiaStatus;

@property (strong, nonatomic) IBOutlet UILabel *lossReason;

@end
