//
//  Player.m
//  TwoPlayerMath
//
//  Created by Frank Chen on 2019-05-06.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _numberOfLives = 3;
        _gameOver = NO;
        _score = 0;
        _name = [[NSString alloc]init];
    }
    return self;
}

- (void)losingLife{
    _numberOfLives -= 1;
    
    if (_numberOfLives == 0) {
        _gameOver = YES;
    }
}

@end
