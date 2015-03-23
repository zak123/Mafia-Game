//
//  MafiaViewController.h
//  Mafia Game
//
//  Created by Zachary Mallicoat on 3/23/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiniGame.h"

@interface MafiaViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) MiniGame *mafiaStatusUpdate;

@property (strong, nonatomic) IBOutlet UITextField *answerInputField;
@property (strong, nonatomic) IBOutlet UILabel *minigameQuestion;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) NSDictionary *mafiaQuestions;
@property (strong, nonatomic) NSString *answer;
@property (strong, nonatomic) IBOutlet UILabel *civilianStatusLabel;

@end
