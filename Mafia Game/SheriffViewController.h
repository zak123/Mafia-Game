//
//  SheriffViewController.h
//  Mafia Game
//
//  Created by Zachary Mallicoat on 3/23/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiniGame.h"

@interface SheriffViewController : UIViewController

@property (strong, nonatomic) MiniGame *sheriffStatusUpdate;

@property (strong, nonatomic) NSDictionary *sheriffQuestions;

@property (strong, nonatomic) IBOutlet UILabel *civiliansAliveLabel;
@property (strong, nonatomic) IBOutlet UILabel *minigameQuestion;
@property (strong, nonatomic) IBOutlet UITextField *answerInputField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) NSString *answer;

@end
