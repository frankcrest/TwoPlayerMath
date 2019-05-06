//
//  GameModel.m
//  TwoPlayerMath
//
//  Created by Frank Chen on 2019-05-06.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (void)createPlayers{
    Player* player1 = [[Player alloc]init];
    player1.name = [NSString stringWithFormat:@"Player 1"];
    [self.players addObject:player1];
    
    Player* player2 = [[Player alloc]init];
    player2.name = [NSString stringWithFormat:@"Player 2"];
    [self.players addObject: player2];
}

- (void)generateRandomQuestion{
    NSArray* operations = @[@"+", @"-", @"*", @"/"];
    NSInteger randomOperationIndex = arc4random_uniform(4);
    NSString* randomOperation = operations[randomOperationIndex];
    
    NSInteger firstNumber = arc4random_uniform(20) + 1;
    NSInteger secondNumber = arc4random_uniform(20) + 1;
    
    if ([randomOperation isEqualToString:@"+"]) {
         self.answer = firstNumber + secondNumber;
    } else if ([randomOperation isEqualToString:@"-"]){
        self.answer = firstNumber - secondNumber;
    } else if ([randomOperation isEqualToString:@"*"]){
        self.answer = firstNumber * secondNumber;
    } else if ([randomOperation isEqualToString:@"/"]){
        self.answer = firstNumber / secondNumber;
        NSLog(@"%ld", self.answer);
    }
   
    self.question = [NSString stringWithFormat:@"%ld %@ %ld ?", (long)firstNumber, randomOperation, (long)secondNumber];
    self.currentIndex += 1;
    
}

- (Player *)currentPlayer{
    NSInteger playerIndex = _currentIndex % 2;
    return _players[playerIndex];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gameOver = NO;
        _currentIndex = 1;
        _players = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
