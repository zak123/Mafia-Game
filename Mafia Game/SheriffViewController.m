//
//  SheriffViewController.m
//  Mafia Game
//
//  Created by Zachary Mallicoat on 3/23/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "SheriffViewController.h"
#import "MiniGame.h"

@implementation SheriffViewController

-(void) viewDidLoad {
    
    
    self.sheriffStatusUpdate = [[MiniGame alloc] init];
    
    self.sheriffStatusUpdate.civilianStatus = [NSNumber numberWithInt:5];
    
    self.sheriffStatusUpdate.mafiaStatus = [NSNumber numberWithInt:1];
    
    
    //Initialize array of mafia questions
    
    _sheriffQuestions = [[NSDictionary alloc] initWithObjectsAndKeys:@"answer 1", @"question 1", @"answer 2", @"question 2",@"answer 3", @"question 3",@"answer 4", @"question 4",@"answer 5", @"question 5", nil];
    
    
    //Get random question
    
    [self getRandomQuestion];
    
    
}

-(void) mafiaIsKill {
    // game over for mafia
    
    
    
    [self performSegueWithIdentifier:@"youWinSegue" sender:self];
    
}


-(void) getRandomQuestion {
    
    
    
    NSArray *array = [_sheriffQuestions allKeys];
    int random = arc4random_uniform(4);
    NSString *question = [array objectAtIndex:random];
    
    _answer = [_sheriffQuestions valueForKey:question];
    NSLog(@"answer is %@",_answer);
    
    
    _minigameQuestion.text = [NSString stringWithFormat:@"%@", question];
    
    
    
}

- (IBAction)submitButton:(id)sender {
    [self wasAnswerCorrect];
}

-(void) wasAnswerCorrect {
    
    if ([_answerInputField.text isEqualToString:_answer]) {
        NSLog(@"correct");
        
        [self punishMafia];
        
    }
    
    else {
        NSLog(@"incorrect");
        
        [self killCivilian];
        
        if ([self.sheriffStatusUpdate.civilianStatus isEqualToNumber:@(0)]) {
            [self performSegueWithIdentifier:@"youLoseSegue" sender:self];
        }
        
        
        // do losing things
    }
    
}

-(void) killCivilian {
    
    int civilianStatusInt = [self.sheriffStatusUpdate.civilianStatus intValue];
    
    civilianStatusInt--;
    
    self.sheriffStatusUpdate.civilianStatus = [NSNumber numberWithInt:civilianStatusInt];
    
    self.civiliansAliveLabel.text = [NSString stringWithFormat:@"%@", self.sheriffStatusUpdate.civilianStatus];
    
    [self getRandomQuestion];
    
    
    NSLog(@"%@", self.sheriffStatusUpdate.civilianStatus);
}

-(BOOL) punishMafia {
    int randomNumber;
    
    randomNumber = arc4random_uniform(2);
    
    if (randomNumber == 1) {
        
        self.sheriffStatusUpdate.mafiaStatus = [NSNumber numberWithInt:0];
        
        [self mafiaIsKill];
        
        NSLog(@"Game Over");
        return YES;
    }
    
    else {
        
        
        
        [self getRandomQuestion];
        NSLog(@"Lucky");
        return NO;
    }
}



@end

