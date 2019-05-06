//
//  GameModel.h
//  TwoPlayerMath
//
//  Created by Frank Chen on 2019-05-06.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameModel : NSObject

@property (nonatomic, assign) BOOL gameOver;
@property (nonatomic, strong) NSMutableArray* players;
@property (nonatomic, assign) NSInteger answer;
@property (nonatomic, strong) NSString* question;
@property (nonatomic, assign) NSInteger currentIndex;

-(void)createPlayers;
-(void)generateRandomQuestion;
-(Player*)currentPlayer;

@end

NS_ASSUME_NONNULL_END
