//
//  ViewController.m
//  TwoPlayerMath
//
//  Created by Frank Chen on 2019-05-06.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *p1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *p2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (nonatomic, strong) GameModel* myGameModel;
@property (nonatomic, strong) NSString* userAnswer;
@property (weak, nonatomic) IBOutlet UILabel *correctOrIncorrectLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myGameModel = [[GameModel alloc]init];
    
    [self.myGameModel createPlayers];
    
    self.userAnswer = [[NSString alloc]init];
    [self.myGameModel generateRandomQuestion];
    _questionLabel.text = self.myGameModel.question;
    
}

- (IBAction)zeroPressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"0"];
}

- (IBAction)onePressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"1"];
}

- (IBAction)twoPressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"2"];
}

- (IBAction)threePressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"3"];
}

- (IBAction)fourPressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"4"];
}

- (IBAction)fivePressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"5"];
}

- (IBAction)sixPressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"6"];
}
- (IBAction)sevenPressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"7"];
}
- (IBAction)eightPressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"8"];
}
- (IBAction)ninePressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"9"];
}

- (IBAction)minusPressed:(UIButton *)sender {
    self.userAnswer = [self.userAnswer stringByAppendingString:@"-"];
}

- (IBAction)enterPressed:(UIButton *)sender {
    if ([self.userAnswer integerValue] != self.myGameModel.answer) {
        self.correctOrIncorrectLabel.alpha = 1;
        self.correctOrIncorrectLabel.textColor = UIColor.redColor;
        self.correctOrIncorrectLabel.text = @"Incorrect";
        [UIView animateWithDuration:1.5 animations:^{
            self.correctOrIncorrectLabel.alpha = 0;
        }];
        [self.myGameModel.currentPlayer losingLife];
        NSLog(@"%@ got the answer wrong, you have %ld lives left", self.myGameModel.currentPlayer.name
              , self.myGameModel.currentPlayer.numberOfLives);
        self.myGameModel.gameOver = self.myGameModel.currentPlayer.gameOver;
        if (!self.myGameModel.gameOver) {
            [self repeatGame];
        } else{
            NSLog(@"%@ has lost the game", self.myGameModel.currentPlayer.name);

        }
    } else{
        self.correctOrIncorrectLabel.alpha = 1;
        self.correctOrIncorrectLabel.textColor = UIColor.greenColor;
        self.correctOrIncorrectLabel.text = @"Correct";
        [UIView animateWithDuration:1.5 animations:^{
            self.correctOrIncorrectLabel.alpha = 0;
        }];
        self.myGameModel.currentPlayer.score += 1;
        if ([self.myGameModel.currentPlayer.name isEqualToString:@"Player 1"] ) {
            _p1ScoreLabel.text = [NSString stringWithFormat:@"P1 Score: %ld", (long)self.myGameModel.currentPlayer.score];
            [self repeatGame];
            
        }else{
            _p2ScoreLabel.text = [NSString stringWithFormat:@"P2 Score: %ld", (long)self.myGameModel.currentPlayer.score];
            [self repeatGame];
        }
    }
}

-(void)repeatGame{
    [self.myGameModel generateRandomQuestion];
    _questionLabel.text = self.myGameModel.question;
    _userAnswer = [[NSString alloc]init];
}


@end
