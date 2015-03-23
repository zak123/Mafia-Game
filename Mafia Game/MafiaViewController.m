//
//  MafiaViewController.m
//  Mafia Game
//
//  Created by Zachary Mallicoat on 3/23/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "MafiaViewController.h"
#import "MiniGame.h"

@implementation MafiaViewController

-(void) viewDidLoad {
    
    
    self.mafiaStatusUpdate = [[MiniGame alloc] init];
    
    self.mafiaStatusUpdate.civilianStatus = [NSNumber numberWithInt:5];
    
    self.mafiaStatusUpdate.mafiaStatus = [NSNumber numberWithInt:1];
    
    
    //Initialize array of mafia questions
    
    _mafiaQuestions = [[NSDictionary alloc] initWithObjectsAndKeys:@"answer 1", @"question 1", @"answer 2", @"question 2",@"answer 3", @"question 3",@"answer 4", @"question 4",@"answer 5", @"question 5", nil];
    
    
    //Get random question
    
    [self getRandomQuestion];

    
}

-(void) mafiaIsKill {
    // game over for mafia
    
    
    
    [self performSegueWithIdentifier:@"youLoseSegue" sender:self];
    
}


-(void) getRandomQuestion {
    

    
    NSArray *array = [_mafiaQuestions allKeys];
    int random = arc4random_uniform(4);
    NSString *question = [array objectAtIndex:random];
    
    _answer = [_mafiaQuestions valueForKey:question];
    NSLog(@"answer is %@",_answer);
    

    _minigameQuestion.text = [NSString stringWithFormat:@"%@", question];

    
    
}

- (IBAction)submitAnswerMafia:(id)sender {
    
    [self wasAnswerCorrect];
}

-(void) wasAnswerCorrect {
    
    if ([_answerInputField.text isEqualToString:_answer]) {
        NSLog(@"correct");
        
        [self killCivilian];
    
    }
    
    else {
        NSLog(@"incorrect");
        
        [self punishMafia];
        
        
        
        // do losing things
    }
    
}

-(void) killCivilian {
    
    int civilianStatusInt = [self.mafiaStatusUpdate.civilianStatus intValue];
    
    civilianStatusInt--;
    
    self.mafiaStatusUpdate.civilianStatus = [NSNumber numberWithInt:civilianStatusInt];
    
    self.civilianStatusLabel.text = [NSString stringWithFormat:@"%@", self.mafiaStatusUpdate.civilianStatus];
    
    if (civilianStatusInt == 0) {
        [self performSegueWithIdentifier:@"youWinSegue" sender:self];
    }
    
    [self getRandomQuestion];
    
    
    NSLog(@"%@", self.mafiaStatusUpdate.civilianStatus);
}

-(BOOL) punishMafia {
    int randomNumber;
    
    randomNumber = arc4random_uniform(2);
    
    if (randomNumber == 1) {
        
        self.mafiaStatusUpdate.mafiaStatus = [NSNumber numberWithInt:0];
        
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
